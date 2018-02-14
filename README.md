This Rails app is mainly for users who are on longer-term medication but there would also be a use-case for patients on shorter-term medication to measure their results. Doctors often ask these patients to keep a drug diary to track effectiveness, side-effects, etc. This apps aims to make it easier to record that information. It is a work in progress and will continue to evolve. With this in mind, I've added steps below for functionality I'd like to add over the next period of time.

This app uses Rails 5 and Ruby 2.4

It uses RSpec and Capybara for feature tests.

It uses Devise for user authentication.

Ajax is used for navigating between different entries (days) of the diary. It is also used for adding/removing drugs to/from a prescription.

It currently uses SQLite for DB but that will be upgraded to MySQL or Postgres at a later date.

It uses bootstrap but it is in a very rudimentary stage - the UI will require sprucing up plus it will be mobile optimised

What it can do at the moment:
- Users can register and log in/out
- Users can create diaries
- Users can create prescriptions
- Users can add prescribed drugs
- Users can add/remove drugs from a prescription object
- Users can associate a diary with a prescription
- When a user views a diary, it takes the drug information from the prescription and allows the user to record a daily result and comments for each drug

Things to be added to it:
- Attachments (will need to be polymorphic):
    - Allow user to upload image of prescription
    - Allow user to upload image of side-effects from drugs
- Optimise for mobile
    - As this is to try to make user's life a litter easier, then it should be usable on a mobile screen. Bootstrap will be used for this.
- Authorization system
    - Currently there is only one user per account but it could envisioned that the user would like to share their results with their doctoc. The doctor would have read-only access to the shared diary
    - The user might also want to keep some comments private so they would not be shared/visible to anybody else
- Drugs
    - Currently the user enters the drugs they require including brand and dosage. I would like to split this out in to other tables - 'companies' and 'drugs' along with a less coupled way of adding dosage
    - I'm sure there must be an NHS spreadsheet somewhere that could be regularly imported/parsed for a list of available drugs and their doses. This would be through a rake take or something like it
- Analytics
    - Allow user to see a longer slice of time with the associated results, for example, see the graph of the results from their medicine(s) over a 6 month period
- Code improvements
    - Dead code needs to be removed, more error handlers around finding records needs to be added
    - Better use of scopes for querying
    - Better user of 'includes' to stop n+1 queries
- More tests
    - Feature, controller and unit
