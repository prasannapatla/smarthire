
import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/terralogo.svg';


var page = function (_this: any) {
    return (
        <div className="Exampage">
            <div className="container">
                <div className="nav">
                    <img src={logo} className="float-left logo" />
                    {/* <div className="cat" id="cat" ></div>   */}

                    <div className="timer">
                        <span className="glyphicon glyphicon-time"></span> &nbsp; &nbsp;<span id="timer" className="time_val">60:00</span>
                    </div>
                </div>

                <div className="mob_overflow">
                    <table className="qlist">

                        <thead>
                            <tr>
                                <th colSpan={2} className="que">

                                    <div id="Q" className="q">
                                    </div>
                                    {/* <i style="color:red;font-size:15px;font-weight:100;">Select the correct option</i> */}
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <label><input type="radio" name="a" id="opt1" /><span className="opt1"></span></label>
                                </td>

                                <td>
                                    <label><input type="radio" name="a" id="opt2" /><span className="opt2"></span></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label><input type="radio" name="a" id="opt3" /><span className="opt3"></span></label>
                                </td>

                                <td>
                                    <label><input type="radio" name="a" id="opt4" /><span className="opt4"></span></label>
                                </td>
                            </tr>
                            <tr>
                                <td colSpan={2}>
                                    <input type="hidden" id="id" />
                                    <label className="pcount" id="cnt"> </label>
                                    <input type="button" className="save_btn" onClick={_this.next_que.bind(_this)} value="Next" />
                                    {/* load_que() */}
                                </td>

                            </tr>
                        </tbody>
                    </table>
                    <div id="myalert_box" className="myalert_box alert alert-warning alert-dismissible fade in"
                    >
                        <a href="#" className="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <span className="msg"></span>
                    </div>
                </div>

            </div>
            <div className="mybg"></div>
        </div>
    )
}
export default page;
