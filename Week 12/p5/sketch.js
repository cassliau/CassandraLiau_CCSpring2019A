/*
Week 12
Author: Cassandra Liau
Summary: 5 day temperature and humidity forecast in Taichung, Taiwan from API

*/

//setting the url: 5 day weather forcast of Taichung, Taiwan
var url = "http://api.openweathermap.org/data/2.5/forecast?q=taichung,tw&APPid=c7c378f3bed0ebf7d4f9bc37fcec6cf8&units=metric";

//container for the result
var results;

//boolean to make sure we have our data before doing anything
var loaded = false;

//ping openweather and have our data ready for the sketch
function preload(){
    results = httpGet(url, 'json', false, function(response){
        results = response.list;
        //console.log (results);
        loaded = true;
    });
}

function setup(){
    //canvas 
    createCanvas(600, 800);
    background(150);
    
    //set  colormode
    colorMode(HSB, 100, 100, 100);
}

function draw(){
    background(250);
    stroke(0);
    //if we do not have our data yet, then return from the function
    if (!loaded){
        return;
    }
//map the datas into variables
    for (let i = 0; i < results.length; i++){
        let currCity = results[i];
        let x = map(currCity.main.temp, 0, 20, 0, 100);
        let y = map(currCity.main.temp_min, 0, 20, 0, 100);
        let radius = map(currCity.main.temp_max, 0, 10, 0, 10);
        
        //use the datas as color codes
        fill(currCity.main.humidity, currCity.main.temp, currCity.main.temp_max);
        
        //draw ellipse 
        ellipse(x*i % 600, y, radius, radius);


    }

    
}