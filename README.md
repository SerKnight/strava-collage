Strava Collage - https://github.com/SerKnight/strava-collage

A simple app to start exploring the Strava API. A fun way to showcases your recent activities photos in an interactive collage that shows how fun it is to #GamifyYourExercise

--------

TODO:

* Move api call into background worker, and create progress loader
* Build out database storage to persist a user's data to allow for additional features
* Create more of a DRY api / client connection. I researched 2 main ruby API wrappers but wanted to connect directly to api to learn how calls were structured.
* Increase query to loop all every activity & its photos ( currently just the first 30 as per api's pagination ), can more easily improve this once main query is processed Async.
* Implement html2Canvas for a 'screenshot' so user can save Collage.. Initial attempt lead down the rabbit hole for displaying images in the screenshot || go database route & add 'Share my Canvas' btn that would enable people to post on Facebook, etc.. 
* add controller / helper specs for api calls, & basic authentication flow via selenium


---- API Discovery & Improvement Notes

* Figure out why activity photos API call only returns the thumbnail size ie * format_image(url) ( https://www.strava.com/api/v3/activities/#{activity_id}/photos )
```
{
	...,
	"urls"=>{"0"=>"https://dgtzuqphqg23d.cloudfront.net/tXmy2F2o3X7WKlu_G2yn-rw5e3DLrjhBFnfdqW55AoQ-64x48.jpg"},
	"sizes"=>{"0"=>[64, 48]},
	...
}
```
* Also the format_image(url) method is a bit hacky and doesn't scale to work with every image.. Can remove the motivational animal photos in lui of broken images once ^ issue is fixed

* Include documentation on Distance Unit size & data storage
	- looked through a few libraries for clue of integer to distance storage..
	- ended up taking a few ratios from float -> miles via my personal data.
	- averages to about 1/1610, so using that ratio do display mileage for each card
```
	42704.8	/ 26.53	=> 1609.679
	19388.7	/ 12.04 => 1610.357143
	10266.8	/ 6.38 => 1609.21
	9232.8	/ 5.73 => 1611.3
```

**I did end up finding that distance is defined as being stored in Meters for a lot of the other Objects in the API, hence ( 1609.34 in one mile haha..)**

* Include documentation on moving_time Unit size & Data storage

**Also found elapsed_time integer	is 'The <object> Lap's elapsed time, in seconds**
