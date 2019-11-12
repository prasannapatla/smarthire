import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/terralogo.svg';



var page = function (_this: any) {
    return (
        <div className="Examstart">

            <div className="container">
                <img src={logo} alt="Terralogic" className="logo" />
                <div className="content" >
                    <br />
                    <br />

                    <p id="title">WELCOME TO EXAM PAGE</p>
                    <br />
                    <div className="instr">
                        <p>1. Once you click the start button exam time starts.</p>
                        <p>2. Don't move the cursor out of the border, it's considered as malpractice and the exam will be closed forcefully. </p>
                        <p>3. Once you move to next question, you can't go back to previous question.</p>
                    </div>
                    <div className="mcq col">
                        <p id="ins">MCQ Instructions</p>
                        <p>1. <b>Number of questions: </b><span className='mcq_total'></span></p>
                        <p>2. <b>Total duration of the exam: </b><span className='mcq_dur'></span></p>
                        <p id="start"></p>
                        <button onClick={_this.openWin.bind(_this,"exampage")}>Start Exam</button>
                    </div>
                    <div className="coding col">
                        <p id="ins">Coding Instructions</p>
                        <p>1. <b>Number of questions: </b><span className='code_total'></span></p>
                        <p>2. <b>Total duration of the exam: </b><span className='code_dur'></span></p>
                        <p id="start"></p>
                        <button onClick={_this.openWin2.bind(_this)}>Start Exam</button>
                    </div>
                        <button  id="logout" onClick={_this.user_signout.bind(_this)}>Logout</button>
                </div>
            </div>
        </div>
    )
}
export default page;
