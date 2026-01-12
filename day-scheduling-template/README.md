# Day Scheduling System

A system for planning your days that actually works — built on real patterns, not productivity theater.

## Start Here

1. Open this folder in [Claude Code](https://claude.ai/download) or [Cursor](https://cursor.sh)
2. Say: **"let's get started"**
3. Follow the prompts (~5 minutes)

That's it. Claude will interview you, set up your preferences, and walk you through optional integrations.

---

## What This Is

This is a complete workflow for daily scheduling using AI (Claude or similar). It includes:

- **Preference tracking** — Your constraints, energy patterns, what works and doesn't
- **Daily schedule compilation** — AI-assisted schedule creation that knows your patterns
- **Automatic task rollover** — Incomplete tasks surface the next day
- **Weekly reviews** — Pattern synthesis to keep improving
- **Calendar sync** — Push approved schedules to Google Calendar
- **Reminders integration** — Pull tasks from Apple Reminders

## The Philosophy

This system is built on a few key insights:

### 1. Pick 3 priorities, not 10

You'll consistently plan 8-10 things and get 3-4 done. Stop overpacking. Ask: "If I only got 3 things done today, what would matter most?"

### 2. Work with energy, not against it

Channel your natural patterns rather than fighting them. If you're not a morning person, don't force morning workouts. If you need warm-up time before deep work, that's not procrastination — it's part of the process.

### 3. Deep work = creation only

Admin tasks (emails, logistics, landing pages) break flow. Save them for afternoon blocks. Deep work is for creating: writing, designing, building.

### 4. Warm-up time is real work

That 30-60 minutes of exploring tools, reflecting, creative tinkering before deep work? It helps you settle into focus mode. It's a transition ritual, not wasted time.

### 5. The feedback loop

Reflections feed into weekly reviews. Weekly reviews update preferences. Preferences improve future schedules. The system learns.

## Folder Structure

```
day-scheduling-demo/
├── README.md                           # You are here
├── CLAUDE.md                           # Instructions for Claude (trigger phrases, flows)
├── preferences.md                      # Your constraints, patterns, what works
├── agents/
│   ├── daily-schedule-compiler.md      # Creates daily schedules
│   └── onboarding.md                   # Builds your preferences (run once)
├── schedule/
│   └── YYYY-MM-DD.md                   # Daily schedule files
├── weekly-reviews/
│   └── YYYY-WXX.md                     # Weekly review files
├── tasks/
│   └── reminders.md                    # Task inbox
└── setup/
    ├── reminders-mcp.md                # Apple Reminders integration
    ├── reminders-script.applescript    # Fallback script
    └── google-calendar-mcp.md          # Google Calendar integration
```

## Getting Started

### Step 1: Run the Onboarding Agent

Say "I want to set up my scheduling system" and Claude will run a quick interview (~5 minutes). It asks 3 broad questions:

1. "Tell me about your typical day — when can you work, what gets in the way, and when do you do your best thinking?"
2. "What are you working on right now — and what tends to get neglected?"
3. "When you have a good day, what makes it work? And what usually derails you?"

Answer whatever parts resonate — you don't need to cover everything. Claude generates your personalized `preferences.md` based on your answers.

### Step 2: Set Up Integrations (Optional)

**Apple Reminders** — Pull tasks from your Inbox automatically:
- See `setup/reminders-mcp.md` for MCP setup (works in Claude Code + Cursor)
- Or use `setup/reminders-script.applescript` as a manual fallback

**Google Calendar** — Sync approved schedules:
- See `setup/google-calendar-mcp.md` for setup

### Step 3: Plan Your Day

Say "plan my day" or "what's tomorrow look like?" and Claude will:
- Check your calendar for existing events
- Read your preferences for energy patterns and constraints
- Pull tasks from your inbox
- Ask what you want to focus on (and help you pick 3 if you list too many)
- Create a draft schedule
- Add to Google Calendar once you approve

### Step 4: Reflect at End of Day

Say "end of day" or "how did today go?" and Claude walks you through:
- What got done?
- What didn't happen? Why?
- What energized you today?
- What drained you today?
- What would make tomorrow better?

Answers get captured in your schedule file. Patterns feed into your preferences over time.

### Step 5: Weekly Review

Say "weekly review" or "how did this week go?" and Claude will:
- Read your daily reflections from the week
- Share 3-5 observations (calibration, patterns, wins)
- Suggest 1-2 adjustments for next week
- Open the floor for bigger questions you're wrestling with

The system synthesizes patterns so you can do less work and get better results.

## How the Agent Works

The daily schedule compiler is proactive, not passive:

**Flags overload:** "You've listed 7 priorities — based on your patterns, you'll likely get 3 done. Which 3 matter most?"

**Applies your preferences automatically:**
- Puts deep work in morning blocks
- Schedules exercise when you've noted it works
- Protects your no-meeting days
- Includes warm-up time before deep work

**Reminds you of patterns:** "Last week you noted that opening Slack during deep work was a point of no return — want me to add a reminder?"

**Suggests trade-offs:** When the schedule is tight, shows what would need to move.

**Rolls over incomplete tasks:** Things that didn't get done yesterday surface the next morning.

## Customizing for Yourself

The example files show one person's system (content creator, baby at home, specific energy patterns). To make it yours:

1. Run the onboarding agent to build your `preferences.md`
2. Update the schedule templates in `preferences.md` to match your day structure
3. Adjust the agent prompts if you want different behaviors

The system is designed to learn and evolve. Update your preferences as you discover what works.

## Tools This Works With

- **Obsidian** — For storing and viewing all the files
- **Claude** (claude.ai, Claude Code CLI, or Cursor) — For running the agents
- **Google Calendar** — For syncing approved schedules
- **Apple Reminders** — For pulling in tasks

## Example Interaction

```
You: What's my schedule for tomorrow?

Agent: [Checks for existing schedule — none found]
       [Pulls Google Calendar — you have a 12pm meeting]
       [Reads preferences — tomorrow is Tuesday, meeting day]
       [Pulls reminders inbox — 5 tasks pending]

       Tomorrow is Tuesday. You have a 12pm meeting, so I'm planning
       for about 2 hours of deep work before it, plus afternoon admin.

       You have these in your inbox:
       - Finish course module 3
       - Email about partnership
       - PT exercises
       - Grocery order
       - Book dentist appointment

       That's 5 items. Based on your patterns, you'll realistically
       get 3 done. Which 3 matter most for tomorrow?

You: Module 3, PT, and the email.

Agent: [Creates schedule with warm-up, deep work, meeting, PT at 2pm, email in afternoon]

       Here's the draft. Note: I put PT at 2pm since that's when it
       consistently happens for you. The email is after your meeting
       when you're in "lighter work" mode anyway.

       [Shows schedule]

       Look good? Say "yes" to add to your calendar.
```

---

*Created from a real system that actually gets used. Adapt it to your life.*
