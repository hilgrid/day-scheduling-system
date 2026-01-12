# Instructions for Claude

## Getting Started

When the user says "let's get started", "set up my scheduling system", or this appears to be their first time:

1. Check if `preferences.md` is still the blank template — if so, run onboarding
2. Follow the interview flow in `agents/onboarding.md` (3 broad questions, keep it under 5 minutes)
3. Generate their personalized `preferences.md`
4. Offer to set up integrations (Google Calendar, Apple Reminders)
5. Let them know they can say "plan my day" to create their first schedule

## Plan My Day

When the user says "plan my day", "what's tomorrow look like?", "let's plan tomorrow", or similar:

1. Check for an existing schedule file in `schedule/YYYY-MM-DD.md`
2. Read `preferences.md` for their constraints, energy patterns, and schedule templates
3. Check Google Calendar for existing events using `list-events`
4. Pull tasks from `tasks/reminders.md` or Reminders MCP if available
5. Check yesterday's schedule for incomplete items (rollover)
6. Ask what they want to focus on — if they list more than 3 things, help them prioritize
7. Create a draft schedule following the template in `agents/daily-schedule-compiler.md`
8. Show the draft and iterate until it looks right
9. On approval, add events to Google Calendar (checking for conflicts first)

Reference `agents/daily-schedule-compiler.md` for detailed guidance on proactive behaviors, philosophy, and schedule format.

## End of Day Reflection

When the user says "let's do my reflection", "end of day", or "how did today go?":

1. Find today's schedule file in `schedule/YYYY-MM-DD.md`
2. Walk them through the reflection questions conversationally:
   - What got done?
   - What didn't happen? Why?
   - What energized you today?
   - What drained you today?
   - What would make tomorrow better?
3. Capture their answers in the reflection section of the schedule file
4. If any patterns emerge, note them in `preferences.md` under "What Works" or "What Doesn't Work"

## Weekly Reflection

When the user says "weekly review", "how did this week go?", or "let's reflect on the week":

1. Read all daily schedule files from that week (check `schedule/` folder)
2. Do the synthesis work for them — share 3-5 observations:
   - Calibration: "You planned X things, completed Y" (helps them stop overpacking)
   - Patterns: What kept getting skipped? What consistently energized or drained them?
   - Wins: What went well that's worth protecting?
3. Ask 1-2 quick questions to fill gaps:
   - "What felt like your best day this week?"
   - "Anything I'm missing?"
4. Propose 1-2 small adjustments for next week (not a whole new system)
5. Open the floor: "Anything bigger on your mind? Questions you're wrestling with?"
   - This is an invitation for larger questions (career, priorities, life direction)
   - Use the accumulated context (energy patterns, what they enjoy) to help them think through it
6. Capture key insights in `weekly-reviews/YYYY-WXX.md`
7. Update `preferences.md` if any new patterns emerged

Keep it under 5 minutes. User reacts more than they generate.
