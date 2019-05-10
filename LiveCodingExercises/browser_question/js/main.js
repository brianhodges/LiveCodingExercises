var friends = [
    { name: "Ray",   color: "red",     bgcolor: "#F77777" },
    { name: "Oscar", color: "orange",  bgcolor: "#000000" },
    { name: "Gwen",  color: "green",   bgcolor: "#7FFFD4"},
    { name: "Bob",   color: "blue",    bgcolor: "#00FFFF"},
    { name: "Marie", color: "magenta", bgcolor: "#FFB6C1" }
];

friends = shuffle(friends);

for (var i = 0; i < friends.length; i++) {
    var li = document.createElement("div");
    li.innerHTML = "Hello, " + friends[i].name;
    li.style.color = friends[i].color;
    li.style.backgroundColor = friends[i].bgcolor;
    
    var div = document.getElementById("main-content");
    div.appendChild(li);
}


function shuffle(array) {
  var currentIndex = array.length, temporaryValue, randomIndex;

  while (0 !== currentIndex) {
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
}