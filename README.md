# DevCycle Ruby Server SDK Example App

An example app built using the [DevCycle Ruby Server SDK](https://docs.devcycle.com/sdk/server-side-sdks/ruby/) with local bucketing

## Requirements

Docker

## Creating a Demo Feature
This example app requires that your project has a feature with the expected variables, as well as some simple targeting rules. 

#### ⇨ [Click here](https://app.devcycle.com/r/create?resource=feature&key=hello-togglebot) to automatically create the feature in your project ⇦

When you run the example app and switch your identity between users, you'll be able to see the feature's different variations.

## Running the Example
### Setup

* Create a `.env` file and set `DEVCYCLE_SERVER_SDK_KEY` to your Environment's SDK Key.\
You can find this under [Settings > Environments](https://app.devcycle.com/r/environments) on the DevCycle dashboard.
[Learn more about environments](https://docs.devcycle.com/essentials/environments).

### Development

`source .env && docker build --build-arg DEVCYCLE_SERVER_SDK_KEY -t devcycle-ruby-example . && docker run -p 8000:8000 devcycle-ruby-example`

Runs the app in the development mode.\
Requests may be sent to http://localhost:8000

## Documentation
For more information about using the DevCycle Ruby Server SDK, see [the documentation](https://docs.devcycle.com/sdk/server-side-sdks/ruby/)
