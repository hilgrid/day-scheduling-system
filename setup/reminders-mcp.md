# Apple Reminders Integration

Pull tasks from your Apple Reminders "Inbox" list automatically.

---

## Option A: Reminders MCP Server (Recommended)

MCP (Model Context Protocol) servers let Claude access external services directly. This works in both Claude Code CLI and Cursor.

### Step 1: Install the Reminders MCP Server

There are community MCP servers for Apple Reminders. Check the [MCP Servers directory](https://github.com/modelcontextprotocol/servers) for the latest options.

Example installation (using a hypothetical reminders server):

```bash
npm install -g @anthropic/mcp-server-reminders
```

### Step 2: Configure Claude Code

Add to your Claude Code config (`~/.claude/settings.json` or project settings):

```json
{
  "mcpServers": {
    "reminders": {
      "command": "mcp-server-reminders",
      "args": []
    }
  }
}
```

### Step 3: Configure Cursor

Add to your Cursor MCP settings (Settings > MCP):

```json
{
  "reminders": {
    "command": "mcp-server-reminders",
    "args": []
  }
}
```

### Step 4: Test It

Ask Claude: "What's in my Reminders Inbox?"

It should list your pending reminders.

### Step 5: Update the Schedule Compiler

The daily-schedule-compiler.md already includes hooks for Reminders MCP. When available, it will:
- Pull tasks from your "Inbox" list
- Include them when creating schedules
- Let you mark them complete

---

## Option B: Manual Script (Fallback)

If you prefer not to use MCP, you can export reminders manually.

### Using the AppleScript

Run `setup/reminders-script.applescript` before your scheduling session:

```bash
osascript setup/reminders-script.applescript > tasks/reminders.md
```

This exports your Inbox to the tasks file, which the compiler can read.

### Using Shortcuts

You can also create a Shortcut on macOS/iOS that:
1. Gets reminders from "Inbox" list
2. Formats them as markdown
3. Saves to `tasks/reminders.md`

Then run the shortcut before scheduling.

---

## Quick Capture with Back Tap (iPhone)

The fastest way to capture tasks: double-tap the back of your iPhone, speak, done.

### Step 1: Create Your Inbox List

Open Apple Reminders and create a new list called "Inbox" (if you don't have one already). This is where all quick captures will go.

### Step 2: Create the Shortcut

1. Open the **Shortcuts** app on your iPhone
2. Tap **+** to create a new shortcut
3. Search for **Dictate Text** and add it — this opens a voice dialog to capture what you say
4. Search for **Add New Reminder** and add it
5. In the Add New Reminder action:
   - Tap the "Reminder" field and select **Dictated Text** (the variable from the previous step)
   - Tap "Reminders" and select your **Inbox** list
6. Name the shortcut something like "Quick Capture" or "Add to Inbox"

### Step 3: Set Up Back Tap

1. Go to **Settings > Accessibility > Touch > Back Tap**
2. Choose **Double Tap** (or Triple Tap if you prefer)
3. Scroll down to your shortcuts and select "Quick Capture"

### How to Use It

1. Double-tap the back of your iPhone
2. Speak your task: "Call mom" or "Buy groceries" or "Email Sarah about the project"
3. It gets added to your Inbox automatically

The task will show up when you plan your day — Claude pulls from this list and asks which tasks to prioritize.

---

## Which Inbox List?

The system assumes you have a list called "Inbox" in Apple Reminders. This is a common GTD-style setup where you capture everything quickly, then process later.

If your list is named differently, update:
- The MCP server configuration
- The AppleScript (change "Inbox" to your list name)
- The Quick Capture shortcut

---

## Troubleshooting

**MCP not connecting:**
- Check that the server is installed globally (`npm list -g`)
- Verify the config path is correct
- Restart Claude Code / Cursor after config changes

**Permissions error:**
- macOS may prompt for Reminders access — grant it
- Check System Preferences > Privacy & Security > Reminders

**Tasks not syncing:**
- Make sure you're using the correct list name
- Try the manual script to verify tasks are accessible
