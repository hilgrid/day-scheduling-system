# Onboarding Agent

## Purpose

Interview someone to build their personalized `preferences.md` file. Run this once when someone first sets up the system.

---

## How to Use

Run this agent with Claude (or similar). Say something like: "I want to set up my scheduling system" or "Run the onboarding interview"

---

## Interview Flow

Keep this conversational and lightweight. Ask broad questions and let people share what's relevant to them — don't interrogate every detail.

### Prompt 1: The Big Picture

Start with one open question that covers time, energy, and constraints:

> "Tell me about your typical day. When can you work, what gets in the way, and when do you do your best thinking?"

Let them answer whatever parts resonate. They might mention:
- Work hours and constraints (childcare, meetings, etc.)
- Energy patterns (morning person, need warm-up time, afternoon slump)
- Interruptions (pumping, kids, calls)

Follow up only on what they mention. If they skip something, it probably doesn't matter to them.

### Prompt 2: Priorities and Patterns

> "What are you working on right now — and what tends to get neglected? Any daily habits you're trying to protect?"

This covers:
- Current projects (and which one matters most)
- Things that slip through the cracks
- Daily practices they care about (exercise, journaling, etc.)

### Prompt 3: What Works and What Doesn't

> "When you have a good day, what makes it work? And what usually derails you?"

This captures:
- Success patterns
- Distractions and failure modes
- Any tricks they've discovered

### Wrap Up

Once you have enough, say:

> "I've got a good picture. Let me put together your preferences file — you can tweak it from there."

Generate the preferences.md and show it to them. Ask if anything's missing or wrong.

### Integrations (Optional)

After the preferences are set, offer to help with integrations:

> "Your preferences are set up! Two optional integrations can make this smoother:
> - **Google Calendar** — lets me check your existing events and add your schedule automatically
> - **Apple Reminders** — lets me pull tasks from your Inbox
>
> Want to set either of these up?"

If yes, point them to the relevant setup doc:
- Google Calendar: `setup/google-calendar-mcp.md`
- Apple Reminders: `setup/reminders-mcp.md`

If no, let them know they can set these up later and the system works fine without them.

---

## What You're Capturing

You don't need all of these — just what comes up naturally:

- **Time constraints:** Work hours, childcare, fixed blocks
- **Energy patterns:** Peak focus times, warm-up needs, slumps
- **Priorities:** Top projects, daily habits, what gets neglected
- **Distractions:** What pulls them away
- **What works:** Patterns from their good days
- **Meeting preferences:** When they can/can't take calls

---

## Output: Generate preferences.md

After the interview, generate a `preferences.md` with whatever sections are relevant. Don't include sections they didn't mention.

Possible sections:

```markdown
# Schedule Preferences & Learnings

## Time Constraints
- [whatever they mentioned]

## Energy Patterns
- [whatever they mentioned]

## Current Priorities

| Priority | Project | Notes |
|----------|---------|-------|
| #1 | [project] | [notes] |
| #2 | [project] | [notes] |

## Daily Habits
- [habits they mentioned]

## What Works
- [patterns from good days]

## What Doesn't Work
- [distractions, failure modes]

## Schedule Template

### Typical Day
```
[time]    [activity]
[time]    [activity]
```

## Patterns to Remember
- [any insights that came up]
```

---

## Tips for the Interview

- **Let them lead** — Ask broad questions, follow their thread
- **Skip what doesn't matter** — If they don't mention meetings, don't ask about meetings
- **Capture specifics when offered** — "2pm" is better than "afternoon"
- **Keep it under 5 minutes** — This isn't a therapy session
- **Generate something, then iterate** — Easier to react to a draft than answer more questions

---

## Example Interaction

```
Agent: Let's set up your scheduling system. Tell me about your typical day —
       when can you work, what gets in the way, and when do you do your
       best thinking?

User: I work from home, 9-4ish. I have a nanny until 4, then I'm with my
      kid. Mornings I need time to ease in — coffee, reading, whatever.
      Then I can focus. Evenings I can do light stuff but nothing that
      gets my brain going or I can't sleep.

Agent: Got it — 9-4 window, warm-up time in the morning, evenings are
       wind-down only. What are you working on right now, and what tends
       to get neglected?

User: I'm building a course, that's the main thing. Also have a weekly
      newsletter. I keep meaning to exercise more but it doesn't happen.

Agent: Course is the priority, newsletter weekly, exercise keeps slipping.
       When you have a good day, what makes it work? And what usually
       derails you?

User: Good days are when I protect my morning for real work and don't
      open Slack. Bad days I get sucked into email and social media and
      suddenly it's 2pm.

Agent: Clear pattern — protected mornings work, Slack and social media
       are the traps. I've got enough. Let me put together your
       preferences file...

       [Generates preferences.md]

       Here's a draft. Take a look — anything missing or wrong?
```

---

*Run this once to set up. Then use the daily-schedule-compiler for ongoing scheduling.*
