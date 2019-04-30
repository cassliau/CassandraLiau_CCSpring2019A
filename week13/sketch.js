/*
Week 13 multimedia sketch_1
Author: Cassandra Liau
Summary: using amplitude in sound in a sketch
*/

//container for song file 
var file;

//slider 
var ampSlider;

//play/pause button
var playButton;

//container for amplitude object
var amp;

//array container for volume graph
var graph = [];

function preload() {
    //load soundfile 
    file = loadSound("barradeen-life-with-you.mp3");
}

function setup() {
    createCanvas(600, 600);
    background(0);
    stroke(255);

    //create p5.Amplitude object
    amp = new p5.Amplitude();

    //set smoothness of the amplitude
    amp.smooth(1);

    //make amp slider
    ampSlider = createSlider(0, 1, 0.5, 0.01);

    //create button
    playButton = createButton("Pause");

    //call function for the button 
    playButton.mousePressed(toggleSong);

    //play the file
    file.play();
}


function draw(){
    background(0);

    //use ampSlider to adjust the song volume
    file.setVolume(ampSlider.value());

    //get the current volume of the song
    var vol = amp.getLevel();

    //push it to the volume array
    graph.push(vol);

    background(vol*200, vol*100, 50);

    //draw the amplitude graph like bubbling effect based on volume
    noFill();
    beginShape();
    for(var i = 0; i < graph.length; i++){
        circle(i, graph[i]*1000, vol*100);
    }
    endShape();

    //scrolling effect
    if(graph.length > width){
        graph.splice(0,1);
    }
}

//function for play/pause button
function toggleSong(){
    if(!file.isPlaying()){ //if the song isn't playing 
        file.play();
        playButton.html("Pause");
    }else{ //if the song is already playing
        file.pause();
        playButton.html("Play");
    }
}