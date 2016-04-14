### Rails Engine

#### Project Description
Rails Engine is an API that was build as a student project. The main purpose of the project is to serve an internal API and use advance active record queries to calculate complex buisness intelligents. Here is the link to the [project spec] (https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md).

#### Rails Engine Setup
* `clone` down the project
* `cd` into rails_engine 
* `bundle`
* run `rake db:setup`
* run `rake import` to setup the database - this rake task populates the the database with all the csv files in the data folder

#### Rspec Testing
* run `rspec` - this runs all the request tests written in rspec which tests all the API endpoints

#### Spec Harness
* `clone` down the spec harness 
* `cd` rales_engine_spec_harness
* `bundle`
* the test assumes that your rails engine in running in http://localhost:3000
* in the spec harness run `rake` to test the rails engine project
* Here is the link to the [spec harness] (https://github.com/turingschool/rales_engine_spec_harness)
