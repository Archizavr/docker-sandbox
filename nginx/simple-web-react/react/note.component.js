class Note extends React.Component {
    render() {
        let attributes = {className: "item note", style: {
            backgroundColor: "red"
        }
    };
        let html = [
            e("h1", null, this.props.title),
            e("p", null, this.props.text)
        ];


        return e("div",attributes, html);
    }
    
}