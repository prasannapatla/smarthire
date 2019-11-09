import React from 'react';
import './Test.scss';
import page from './TestHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
import emoji from '../assets/output-onlinepngtools.png'
var swal = require('@sweetalert/with-react')

class Test extends Myservice {
   

    constructor(props: any) {
        super(props);
    }

    componentDidMount() {

       
        super.componentDidMount();
    }

    componentDidUpdate() {
        super.componentDidUpdate();
    }
    capture(){
     
    }


    onPick(value: any) {

        swal("Thanks for your rating!", `You rated us ${value}/5`, "success")
            .then(() => {
                alert("close")
            });
    }



    MoodButton = ({ rating, onClick }: any) => {
        let inv_rating = 5 - rating + 1
        let scale = inv_rating * 60;
        if (inv_rating != 1)
            scale += 4 * inv_rating


        return (
            <button
                style={{ width: "60px", height: "60px", background: "url('" + emoji + "')", backgroundPosition: scale + 'px -130px', border: "none" }}
                data-rating={rating}
                className="mood-btn rate"
                onClick={() => onClick(rating)}
            //   {_this.openWin.bind(_this)}
            />

        )
    }

    test = () => {
        swal({
            text: "How was your experience?",
            buttons: {
                cancel: "Close",
            },
            content: (

                <div>
                    <this.MoodButton
                        rating={1}
                        onClick={this.onPick.bind(this)}
                    />
                    <this.MoodButton
                        rating={2}
                        onClick={this.onPick.bind(this)}
                    />
                    <this.MoodButton
                        rating={3}
                        onClick={this.onPick.bind(this)}
                    />
                    <this.MoodButton
                        rating={4}
                        onClick={this.onPick.bind(this)}
                    />
                    <this.MoodButton
                        rating={5}
                        onClick={this.onPick.bind(this)}
                    />
                </div>
            )

        })
    }



    render() {
        return (
            page(this)
        )
    }
}

export default Test;
