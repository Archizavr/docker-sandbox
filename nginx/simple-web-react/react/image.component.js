class Image extends React.Component {
    enlarge () {
        window.open(this.props.imageSrc);
    }

    render() {
        let html = e("div", null, this.props.desc);
        let attributes = {className: "item image", 
        style: {
            backgroundImage: "url(" + this.props.imageSrc + ")"
            
        },
        onClick: this.enlarge.bind(this)         
    };
        return e("div",attributes, html);
    }
}
