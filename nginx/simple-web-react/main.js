ReactDOM.render(
    [ 
        e(Image, {desc: "Savanna",imageSrc: "resources/images/savanna.jpg"}),
        e(Image, {desc: "Forest",imageSrc: "resources/images/forest.jpg"}),
        e(Image, {desc: "Underwater",imageSrc: "resources/images/underwater.jpg"}),
        e(Image, {desc: "Desert",imageSrc: "resources/images/desert.jpg"}),
        e(Image, {desc: "Mountains",imageSrc: "resources/images/mountain.jpg"}),
        e(Note, {title: "BIG Title", text: "INFORMATION!!!"})
    ], 
    document.querySelector(".image-container")
    );