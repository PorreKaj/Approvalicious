# Approvalicious
Extending SCCM approval workflow using AD and UniversalDashboard

Very early work in progress

# General idea

"Approvals" are in fact assets in a company, and should be stored accordingly. 

# Thoughts

The application approval request workflow in SCCM is very bare minimum - but easily managed by powershell.
The goals of this experiment are:

- Scrape SCCM for approvalrequests and dump them in a database (Scheduled task vs UD endpoint vs UA).
- Build a UD Frontend (Link + GUID), that uses dynamic pages that grants managers the option to Approve/Decline/Approve temporarily requests.
- The Frontend will also have a dashboard that displays all requests relevant to the manager.
- New scraped requests will generate an email to the requestee's manager (AD attribute) and will contain a link to the Frontend with a unique identifier - this will allow the manager to forward the link. - AD SSO will be used to log who approves what.
- Approving a request will kick off a script that approves the application - but can also easily be extend, in my case, adding the requestee to AD groups for citrix application access and m365 licenses is a goal.
- "Temporary approvals" will mark the approval with an expiration date, a task will monitor for expired approvals and kick off a script to reverse the changes.

- once the SCCM integration and workflow is finetuned, the idea
