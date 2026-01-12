# Google Calendar Integration

Sync your approved schedule directly to Google Calendar.

---

## What This Enables

Once set up, the daily schedule compiler can:
- **Read** your existing calendar events (to avoid conflicts)
- **Create** new events for your schedule blocks
- **Add to multiple calendars** (yours + spouse, for example)

---

## Step 1: Install Google Calendar MCP Server

The official Google Calendar MCP server is available from Anthropic:

```bash
npm install -g @anthropic/mcp-server-google-calendar
```

Or check the [MCP Servers directory](https://github.com/modelcontextprotocol/servers) for alternatives.

---

## Step 2: Set Up Google OAuth

The calendar server needs permission to access your Google Calendar.

### Create OAuth Credentials

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project (or use existing)
3. Enable the Google Calendar API
4. Create OAuth 2.0 credentials (Desktop app type)
5. Download the credentials JSON file

### Configure the Server

Place your credentials file and configure the server:

```bash
# First-time setup — this will open a browser for OAuth
mcp-server-google-calendar --setup
```

Follow the prompts to authorize access to your calendar.

---

## Step 3: Configure Claude Code

Add to `~/.claude/settings.json`:

```json
{
  "mcpServers": {
    "google-calendar": {
      "command": "mcp-server-google-calendar",
      "args": []
    }
  }
}
```

---

## Step 4: Configure Cursor

Add to Cursor MCP settings (Settings > MCP):

```json
{
  "google-calendar": {
    "command": "mcp-server-google-calendar",
    "args": []
  }
}
```

---

## Step 5: Test It

Ask Claude: "What's on my calendar tomorrow?"

It should list your events.

---

## Adding to Multiple Calendars

To sync events to both your calendar and your spouse's:

### Option A: Shared Calendar Access

If you have edit access to their calendar:
1. When creating events, specify the calendar ID
2. The compiler can add events to both calendars

Example in the compiler interaction:
> "Add deep work block to my calendar and 'Family Time 4-7pm' to our shared family calendar."

### Option B: Calendar Invites

Create events on your calendar and add your spouse as an attendee:
> "Add the 4pm-7pm family time block and invite Duncan."

They'll receive a calendar invite.

### Configuring Default Calendars

You can set up the compiler to always add certain event types to specific calendars:
- Work events → Your primary calendar
- Family events → Shared family calendar
- Exercise → Your primary calendar

Add this to your `preferences.md`:

```markdown
## Calendar Settings
- **Primary calendar:** [your email]
- **Family calendar:** [shared calendar ID or "Family"]
- **Default behavior:** Add family time blocks to family calendar
```

---

## How the Compiler Uses This

When you approve a schedule ("yes, add to my calendar"):

1. **Reads existing events** to avoid duplicates
2. **Creates new events** for each time block
3. **Skips blocks that already exist** (like pre-scheduled meetings)
4. **Confirms what was added**

Example output:
```
Added to your calendar:
- DEEP WORK: Module 3 (9:15am-11:45am)
- PT exercises (1:30pm-2:00pm)
- Partnership email (2:45pm-3:30pm)

Skipped (already on calendar):
- Meeting with Sam (12:00pm)

Added to family calendar:
- Family time (4:00pm-7:00pm)
```

---

## Troubleshooting

**"Not authorized" error:**
- Re-run `mcp-server-google-calendar --setup` to refresh OAuth
- Check that Calendar API is enabled in Google Cloud Console

**Events not appearing:**
- Verify the correct calendar is selected
- Check the event time zone matches your calendar settings

**Can't access spouse's calendar:**
- They need to share their calendar with you (edit permission)
- Or use the invite approach instead

**MCP not loading:**
- Restart Claude Code / Cursor after config changes
- Check server is installed: `which mcp-server-google-calendar`
