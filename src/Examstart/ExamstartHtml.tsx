import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/terralogo.svg';
import { FaPowerOff } from 'react-icons/fa';
import { BsPlay } from 'react-icons/bs';



var page = function (_this: any) {
    return (
        <div className="Examstart">

            <div className="container_design">
                <img src={logo} alt="Terralogic" className="logo" />
                <div className="content" >
                    <button id="logout" onClick={_this.user_signout.bind(_this)}><FaPowerOff style={{height:"13px",marginLeft:"3px"}}/> Logout</button>
                    <br />
                    <br />

                    <p id="title">Welcome To Exam</p>
                    <br />
                    <div className="instr">
                        <p><b>Start time: </b><span className='start_date'></span></p>
                        <p><b>End time: </b><span className='end_date'></span></p>
                        <p>1. The test will commence once you click the start button.</p>
                        <p>2. Please do not move the cursor out of the current browser window, it's considered as malpractice and the exam will be force closed. </p>
                        <p>3. Don’t use back button</p>
                    </div>
                    <div className="row quesec">
                    <div className="mcq col">
                        <p id="ins">MCQ Section</p>
                        <p>1. Number of questions: <span className='mcq_total'></span></p>
                        <p>2. Total duration of the exam: <span className='mcq_dur'></span> Mins</p>
                        <p id="start"></p>
                        <button onClick={_this.openWin.bind(_this, "exampage")} className="start_exam"><BsPlay className="start"/> Start Exam</button>
                    </div>
                    <div className="coding col">
                        <p id="ins">Coding Section</p>
                        <p>1. Number of questions: <span className='code_total'></span></p>
                        <p>2. Total duration of the exam: <span className='code_dur'></span></p>
                        <p id="start"></p>
                        <button onClick={_this.openWin2.bind(_this)} className="start_exam"><BsPlay className="start"/> Start Exam</button>
                    </div>

                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;
