-- Export Apple Reminders "Inbox" list to Markdown
-- Usage: osascript reminders-script.applescript > ../tasks/reminders.md

tell application "Reminders"
    set inboxList to list "Inbox"
    set incompleteReminders to (reminders of inboxList whose completed is false)

    -- Header
    set output to "# Task Inbox" & linefeed & linefeed
    set output to output & "Exported from Apple Reminders on " & (current date) & linefeed & linefeed
    set output to output & "---" & linefeed & linefeed
    set output to output & "## Inbox" & linefeed & linefeed

    -- List reminders
    repeat with r in incompleteReminders
        set taskName to name of r
        set output to output & "- [ ] " & taskName & linefeed
    end repeat

    -- Footer
    set output to output & linefeed & "---" & linefeed & linefeed
    set output to output & "*Run this script before scheduling to sync your reminders.*" & linefeed

    return output
end tell
