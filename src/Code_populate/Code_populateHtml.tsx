
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { FaPlus } from 'react-icons/fa';

var page = function (_this: any) {
    return (
        <div className="Code_populate">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        {/* <Banner /> */}
                        <div className="main_body">
                            <table className="header">
                                <td className="exam_text1">
                                    Populate <br />Coding exam
                               </td>
                                <td>
                                    <button id="populate_exam1" onClick={_this.create_que_set.bind(_this)}><FaPlus /> Populate Exam
                                    </button>
                                </td>
                            </table>
                            <div className="table-responsive mob_overflow">
                                <table id="category"></table>
                            </div>
                            <div className="table-responsive mob_overflow" style={{ paddingTop: "20px" }}>
                                <table className="table populate">
                                    <tr>
                                        <th className="selectExamText">
                                            Select Exam
                                            </th>
                                        <th data-colSpan={4} className="no_Que_Text">
                                            Number of questions
                                            </th>
                                        <th data-colSpan={4} className="dur_exam_Text">
                                            Duration of the exam
                                            </th>
                                        <th>Remaining Time</th>
                                    </tr>
                                    <tr>
                                        <td><select id='exam' className="selectExam"></select></td>
                                        <td><input type='number' defaultValue="4" placeholder='Total questions' id='total' className="no_Que" />
                                        </td>
                                        <td><input type='number' defaultValue="30" placeholder='Enter Duration' id='dur' className="dur_exam" /><b className="mins">Mins</b>
                                        </td>
                                        <td style={{padding: "unset"}}><b><span className="remaining" style={{marginLeft: "40px", display:"block"}}></span></b></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;

