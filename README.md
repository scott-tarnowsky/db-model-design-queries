# README

Run `cd db-model-design-queries`
Run `rails console`
Run `Patient.all` to find a list of patient names
Run `Provider.all` to find a list of provider names

**note: to test the queries. replace "provider_name" or "patient_name" with a valid patient/provider name**
Eg. `Patient.joins(:providers).where(providers: {name: "Scott Tarnowsky"})`

**note: Run `Patient.all` and `Provider.all` in the rails console to find valid Provider/Patient names**

**note: Replace `:asc` with `:desc` if you want to reverse the order of queries by date**

QUERIES
------------------------------------
● Find all clients for a particular provider
`Patient.joins(:providers).where(providers: {name: "provider_name"})`

● Find all providers for a particular client
`Provider.joins(:patients).where(patients: {name: "patient_name"})`

● Find all of a particular client's journal entries, sorted by date posted.
`Journal.joins(:patient).where(patients: {name: "patient_name"}).order(created_at: :asc)`

● Find all of the journal entries of all of the clients of a particular provider, sorted by date posted
`Journal.joins(patient: { engagement_plans: :provider }).where(providers: { name: "provider_name" }).order(created_at: :asc)`

