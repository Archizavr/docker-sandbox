class Canvas {
    constructor(width, height) {

        this.width = width;
        this.height = height;
        this.context = undefined;
        console.log("Create a new Canvas with width: " + width + " and height: " + height);
        this.createElement();
    }

    createElement() {
        const ele = document.createElement("canvas");
        ele.width = this.width;
        ele.height = this.height;
        document.querySelector("#app").append(ele);
        this.context = ele.getContext("2d")
    }

    clear() {
        this.context.clearRect(0, 0, this.width, this.height);
    }
}
