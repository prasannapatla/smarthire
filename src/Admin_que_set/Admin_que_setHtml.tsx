
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { FaPlus } from 'react-icons/fa';

var page = function (_this: any) {
    return (
        <div className="Admin_que_set">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        {/* <Banner /> */}
                        <div className="data main_body">
                            <table className="header">
                                <td className="exam_text1">
                                    Populate MCQ
                               </td>
                                <td>
                                    <button id="populate_exam1" onClick={_this.create_question_set.bind(_this)}><FaPlus className="plus_icon"/> Populate MCQ
                                    </button>
                                </td>
                            </table>
                            <div className="exam_options">
                                <table className="table populate">
                                    {/* <tr>
                                        <th data-colSpan={4} style={{ fontSize: '16px', position: 'relative', right: '15%' }}>
                                            Duration of the exam
                                        </th>
                                        <th style={{ fontSize: '16px', position: 'relative', right: '24%' }}>Remaining Time</th>
                                    </tr> */}
                                    <tr>
                                        <td style={{paddingLeft: "unset",width: "184px"}}><select id='exam'></select></td>
                                        <td style={{width: "230px"}}><input type='number' placeholder='Enter Duration' id='dur' style={{minWidth:"160px" }}/><span className="mins" style={{ fontSize: '12px' }}> &nbsp;Mins.</span>
                                        </td>
                                        <td style={{width: "300px" }}><span className="remaining"></span></td>
                                    </tr>
                                </table>
                                <div className="table-responsive mob_overflow">
                                    <table id="category"></table>
                                </div>
                            </div>
                            <div className='code_pop'>
                                <table className="header">
                                    <td className="exam_text2">
                                        Populate Code
                               </td>
                                    <td>
                                        <button id="populate_exam1" onClick={_this.create_que_set.bind(_this)}><FaPlus className="plus_icon" /> Populate Code
                                    </button>
                                    </td>
                                </table>
                                <div className="table-responsive mob_overflow">
                                    <table id="category"></table>
                                </div>
                                <div className="table-responsive mob_overflow pop_code" style={{ paddingTop: "20px" }}>
                                    <table className="table populate populate1">
                                        {/* <tr>
                                            <th className="selectExamText" style={{ fontSize: '16px' }}>
                                                Select Exam
                                            </th>
                                            <th data-colSpan={4} className="no_Que_Text" style={{ fontSize: '16px' }}>
                                                Number of questions
                                            </th>
                                            <th data-colSpan={4} className="dur_exam_Text" style={{ fontSize: '16px' }}>
                                                Duration of the exam
                                            </th>
                                            <th style={{ fontSize: '16px' }}>Remaining Time</th>
                                        </tr> */}
                                        <tr style={{marginTop:"10px"}}>
                                            <td style={{paddingLeft:"0px"}}><select id='exam1' className="selectExam"></select></td>
                                            <td><input type='number' placeholder='Enter Duration' id='code_dur' className="dur_exam" /><b className="mins_code" style={{ fontSize: '12px',fontWeight:"unset" }}>Mins.</b>
                                            </td>
                                            <td style={{fontSize:"12px"}}><input type='number' placeholder='Total Questions' id='total' className="no_Que" /><span className="total_que"></span>
                                            </td>
                                            <td style={{ padding: "unset",width: "220px"}}><span className="remaining1" style={{ marginLeft: "12px", display: "block" }}></span></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;
