## Live Streaming
These APIs used to create and manage live streaming event.
* When a Live is not start : it's named as `Event`.
* When have an Event , you can start it : it's named as `Feed`.

See details [here](https://docs.uiza.io/#live-streaming).

## Create a live event
These APIs use to create a live streaming and manage the live streaming input (output).
A live stream can be set up and start later or start right after set up.
Live Channel Minutes counts when the event starts.

See details [here](https://docs.uiza.io/#create-a-live-event).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  name: "test event",
  mode: "push",
  encode: 1,
  dvr: 1,
  description: "This is for test event",
  poster: "https://example.com/poster.jpeg",
  thumbnail: "https://example.com/poster.jpeg",
  linkStream: [
      "https://playlist.m3u8"
  ],
  resourceMode: "single"
}

begin
  live = Uiza::Live.create params
  puts live.id
  puts live.name
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "8b83886e-9cc3-4eab-9258-ebb16c0c73de",
  "name": "checking 01",
  "description": "checking",
  "mode": "pull",
  "resourceMode": "single",
  "encode": 0,
  "channelName": "checking-01",
  "lastPresetId": null,
  "lastFeedId": null,
  "poster": "https://example.com/poster.jpeg",
  "thumbnail": "https://example.com/thumbnail.jpeg",
  "linkPublishSocial": null,
  "linkStream": "[\"https://www.youtube.com/watch?v=pQzaHPoNX1I\"]",
  "lastPullInfo": null,
  "lastPushInfo": null,
  "lastProcess": null,
  "eventType": null,
  "createdAt": "2018-06-21T14:33:36.000Z",
  "updatedAt": "2018-06-21T14:33:36.000Z"
}
```

## Retrieve a live event
Retrieves the details of an existing event.
You need only provide the unique identifier of event that was returned upon Live event creation.

See details [here](https://docs.uiza.io/#retrieve-a-live-event).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  live = Uiza::Live.retrieve "your-live-id"
  puts live.id
  puts live.name
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "8b83886e-9cc3-4eab-9258-ebb16c0c73de",
  "name": "checking 01",
  "description": "checking",
  "mode": "pull",
  "resourceMode": "single",
  "encode": 0,
  "channelName": "checking-01",
  "lastPresetId": null,
  "lastFeedId": null,
  "poster": "https://example.com/poster.jpeg",
  "thumbnail": "https://example.com/thumbnail.jpeg",
  "linkPublishSocial": null,
  "linkStream": "[\"https://www.youtube.com/watch?v=pQzaHPoNX1I\"]",
  "lastPullInfo": null,
  "lastPushInfo": null,
  "lastProcess": null,
  "eventType": null,
  "createdAt": "2018-06-21T14:33:36.000Z",
  "updatedAt": "2018-06-21T14:33:36.000Z"
}
```

## Update a live event
Update the specific Live event by edit values of parameters.

See details [here](https://docs.uiza.io/#update-a-live-event).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  id: "your-live-id",
  name: "live test",
  mode: "pull",
  encode: 0,
  dvr: 1
  resourceMode: "single"
}

begin
  live = Uiza::Live.update params
  puts live.id
  puts live.name
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "8b83886e-9cc3-4eab-9258-ebb16c0c73de",
  "name": "checking 01",
  "description": "checking",
  "mode": "pull",
  "resourceMode": "single",
  "encode": 0,
  "channelName": "checking-01",
  "lastPresetId": null,
  "lastFeedId": null,
  "poster": "https://example.com/poster.jpeg",
  "thumbnail": "https://example.com/thumbnail.jpeg",
  "linkPublishSocial": null,
  "linkStream": "[\"https://www.youtube.com/watch?v=pQzaHPoNX1I\"]",
  "lastPullInfo": null,
  "lastPushInfo": null,
  "lastProcess": null,
  "eventType": null,
  "createdAt": "2018-06-21T14:33:36.000Z",
  "updatedAt": "2018-06-21T14:33:36.000Z"
}
```

## Start a live feed
These API use to start a live event that has been create success.
The Live channel minute start count whenever the event start success

See details [here](https://docs.uiza.io/#start-a-live-feed).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  id: "your-live-id",
  name: "live test",
  mode: "pull",
  encode: 0,
  dvr: 1
  resourceMode: "single"
}

begin
  live = Uiza::Live.start_feed "your-live-id"
  puts live.id
  puts live.name
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "8b83886e-9cc3-4eab-9258-ebb16c0c73de",
  "name": "checking 01",
  "description": "checking",
  "mode": "pull",
  "resourceMode": "single",
  "encode": 0,
  "channelName": "checking-01",
  "lastPresetId": null,
  "lastFeedId": null,
  "poster": "https://example.com/poster.jpeg",
  "thumbnail": "https://example.com/thumbnail.jpeg",
  "linkPublishSocial": null,
  "linkStream": "[\"https://www.youtube.com/watch?v=pQzaHPoNX1I\"]",
  "lastPullInfo": null,
  "lastPushInfo": null,
  "lastProcess": null,
  "eventType": null,
  "createdAt": "2018-06-21T14:33:36.000Z",
  "updatedAt": "2018-06-21T14:33:36.000Z"
}
```

## Get view of live feed
This API use to get a live view status . This view only show when event has been started and being processing.

See details [here](https://docs.uiza.io/#get-view-of-live-feed).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  response = Uiza::Live.get_view "your-live-id"
  puts response.stream_name
  puts response.watchnow
  puts response.day
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```
{
  "stream_name": "peppa-pig-english-episodes",
  "watchnow": 1,
  "day": 1533271205999
}
```

## Stop a live feed
Stop live event

See details [here](https://docs.uiza.io/#stop-a-live-feed).

```ruby
require "uiza"
Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"
params = {
  id: "your-live-id",
  name: "live test",
  mode: "pull",
  encode: 0,
  dvr: 1
  resourceMode: "single"
}
begin
  live = Uiza::Live.stop_feed "your-live-id"
  puts live.id
  puts live.name
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "8b83886e-9cc3-4eab-9258-ebb16c0c73de",
  "name": "checking 01",
  "description": "checking",
  "mode": "pull",
  "resourceMode": "single",
  "encode": 0,
  "channelName": "checking-01",
  "lastPresetId": null,
  "lastFeedId": null,
  "poster": "https://example.com/poster.jpeg",
  "thumbnail": "https://example.com/thumbnail.jpeg",
  "linkPublishSocial": null,
  "linkStream": "[\"https://www.youtube.com/watch?v=pQzaHPoNX1I\"]",
  "lastPullInfo": null,
  "lastPushInfo": null,
  "lastProcess": null,
  "eventType": null,
  "createdAt": "2018-06-21T14:33:36.000Z",
  "updatedAt": "2018-06-21T14:33:36.000Z"
}
```

## List all recorded files
Retrieves list of recorded file after streamed (only available when your live event has turned on Record feature)

See details [here](https://docs.uiza.io/#list-all-recorded-files).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  live = Uiza::Live.list_recorded limit: 2
  puts live.first.id
  puts live.first.entityId
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "040df935-61c4-46f7-a41f-0a899ebaa2cc",
  "entityId": "ee122e85-553f-4621-bc77-1396191d5846",
  "channelName": "dcb8686f-d0f8-4a0f-8b92-22db339eb315",
  "feedId": "3e3b75df-e6fa-471c-b386-8f44b8a34b6c",
  "eventType": "pull",
  "startTime": "2018-12-13T16:28:29.000Z",
  "endTime": "2018-12-13T18:28:29.000Z",
  "length": "7200",
  "fileSize": "9276182",
  "extraInfo": null,
  "endpointConfig": "s3-uiza-dvr",
  "createdAt": "2018-12-13T19:28:43.000Z",
  "updatedAt": "2018-12-13T19:28:43.000Z",
  "entityName": "Christmas 2018 Holidays Special | Best Christmas Songs & Cartoons for Kids & Babies on Baby First TV"
},
{
  "id": "3fec45e9-932b-4efe-b97f-dc3053acaa05",
  "entityId": "47e804bc-d4e5-4442-8f1f-20341a156a70",
  "channelName": "e9034eac-4905-4f9a-8e79-c0bd67e49dd5",
  "feedId": "12830696-87e3-4209-a877-954f8f008964",
  "eventType": "pull",
  "startTime": "2018-12-13T14:14:14.000Z",
  "endTime": "2018-12-13T16:14:14.000Z",
  "length": "7200",
  "fileSize": "439858038",
  "extraInfo": null,
  "endpointConfig": "s3-uiza-dvr",
  "createdAt": "2018-12-13T17:30:42.000Z",
  "updatedAt": "2018-12-13T17:30:42.000Z",
  "entityName": "WATCH: SpaceX to Launch Falcon 9 Rocket #Spaceflight CRS16 @1:16pm EST"
}
```

## Delete a record file
Delete a recorded file

See details [here](https://docs.uiza.io/#delete-a-record-file).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

begin
  live = Uiza::Live.delete "your-record-id" #Identifier of record (get from list record)
  puts live.id
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
  "id": "040df935-61c4-46f7-a41f-0a899ebaa2cc"
}
```
