IRITUS - code exercise

Requirements 
Create a simple ( Rails 4.x ) application which exposes: 
* an API endpoint as a public interface and ( 1 endpoint ) 
* calculate a value based on certain conditions ( 1 attribute )
 #1 Public API Interface responds to the following requests: 

[GET] /api/v1/cars/:car_slug 
Based on RESTful paradigm GET request should receive 'slug of the car' ( uniqe indentifcation of the car model i.e. :subaru_impreza 
Format of the possible responsefrom the the server should looks in the following way: 
data: { 
car: { 
id: 7,
 car_slug: 'subaru_impreza', 
max_speed: '280km/h', 
max_speed_on_track: 'no track selected' 
}
 }

 Endpoint can accept GET parameter i.e. 'track=nurburgring' 
For a sake of an exercise lets have 3 random tracks in the system. 

#2 Calculate max_speed_on_track 
Depends on the passed parameter 'track' system should respond with 'no track selected' in case of lack of parameter, with 'track not found' in case there is no data about it and fnally with a value in [km/h] units for a given car. 

Track 
Each of the tracks should be identifable based on the name, i.e. Nurburgring. Track has attribute surface-type: which can have possible values: { snow, gravel, asphalt } 

Logic 
Ultimately value is calculated as mathematical difference between max speed and a percentage of how specifc track gonna to slow down car based on its type of surface. 
i.e. for surface-type 'snow', slowing-factor will be 35% of the max speed, what gives: 
max_speed_on_track = max_speed - ( 35% of max_speed ) 

Basic version 
Chose random value from the range [ 0.. 35 ] represent as a percentage. 
IMPORTANT NOTE: as calculation of this value is not main focus of this task, we could have a a simple hash, like: { snow: 35, gravel: 12, etc } which handles with that. This solution however will not be consider as acceptable as number of possible strategies per type, will continuously grow, by being extended ( not part of the task ) by factors like: 
• track, 
• time of the year ( season ) 
• time of the day ( taken automaticaly ) 
• etc. 

Extended version 
In the basic version it was defned 'slowing-factor' and possibility of extending list of factors in the future. Lets add a time factor. 
Server resolving request is based in Europe confgure for CET timezone. Factor of 'current driving time' should be considering current time in specifc time zone where track is based. 
Logic of time_of_the_day should apply additional slowing factor 

Time frames: | Slowing-factor 
9am – 6pm | 0% 
6pm – 9.30pm | 8% 
9.30pm – 6am | 15% 
6am – 9am | 8% 

Tracks: 
( Germany ) Nurburgring - CET 
( Australia ) Sydney Motorsport Park - Australian Eastern Time Zone UTC+10:00 
( Canada ) Circuit Gilles Villenaeuve Montreal - Eastern Time Zone UTC-05:00 
( Macau ) Guia Circut – China Time Zone UTC +08:00 Lets have seed those data in the system 

Acceptance Criteria: 
1. System should expose public interface which accepts GET request with slug of the car and respond with it max_speed / max_speed on given track 2. calculation for 'max_speed_on_track' should be done accordingly to specifcation and prepare for further expansion: currently including 'surface type' and 'current driving time' factors 

Suggested Models 
Car | Track – up to you how to call them 

Authorization & Authentication 
NOT required. 

Seed data 
Tracks data are required. 

GUI 
Any of the GUI elements are NOT required. 

While building this endpoint: 
* use git and commit possible often using descriptive commits descriptions * use OOP principles 
* use TDD and any test framework which is comfortable for you to build this application 
* use any gem and data storage which you can fnd useful 

