import React from 'react';
import { Link } from 'react-router-dom';
import loading from '../assets/loading2.gif';
import logo from '../assets/terralogo.svg';
import { FiCheckCircle } from 'react-icons/fi';
import { AiFillCaretRight } from 'react-icons/ai';
var page = function (_this: any) {
    return (
        <div className="Code_editor">
            <div className="top_line">
                <b className="heading"><img src={logo} className="avatar" /></b>
                <div className="menues2">
                    <b className="ps"> <span className="glyphicon glyphicon-time"></span> &nbsp; &nbsp;<span id="timer" className="time_val">60:00</span></b>
                </div>
            </div>
            <div className="top_line">
                <div className="menues">
                    <b className="ps">Problem statement: </b>
                </div>
            </div>
            <div className="question">
                <div className="recv_que"></div><br /><br />

                <b>Note:</b> Primary class name should be pgm
            </div>
            <div className="top_line">
                <div className="menues">
                    <select id="pgm_lang">
                        <option value="cpp">C/C++ </option>
                        <option value="java">Java </option>
                        {/* <option value="py">python2</option> */}
                        <option value="py3">Python</option>
                        <option value="js">Javascript</option>
                    </select>
                    {/* <input type='button' onClick={_this.run_code.bind(_this)} value="Run code" /> */}
                </div>
            </div>
            <textarea id="code" rows={20} className='edit_area code'></textarea>
            <table className="io">
                <thead>
                    <tr>
                        <th>
                            <h2 className="input">Inputs</h2>
                            <button className="run_code" onClick={_this.run_code.bind(_this)} ><AiFillCaretRight className="r_icon"/> Run code</button>
                            <img src={loading} className="loading" />
                        </th>
                        <th>
                            <h2 className="output">Output</h2>
                           
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <textarea className="inputs" id="inputs" ></textarea>
                        </td>
                        <td>
                        <textarea className="output" id="output" readOnly></textarea>
                            {/* <pre className="output" id="output"></pre> */}
                        </td>
                    </tr>
                </tbody>
            </table><br />
            <div className="submit_div">
            <button className="submit_code" onClick={_this.submit_code.bind(_this)} ><FiCheckCircle className="r_icon"/> Submit code</button>
            </div>
            <h3 className="testcase"></h3><br />
        </div>
    )
}
export default page;
