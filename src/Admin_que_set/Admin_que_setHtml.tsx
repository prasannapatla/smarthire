
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
                        <div className="main_body">
                            <div className="page_header">
                               <p className="exam_text">
                                   Populate exam
                               </p>
                            </div>
                            <button id="populate_exam" onClick={_this.create_question_set.bind(_this)}><FaPlus/> Populate Exam
                            </button>
                            <div className="exam_options">
                                <table className="table populate">
                                    <tr>
                                        <th style={{fontSize:'16px'}}>
                                            Select Exam
                                        </th>
                                        <th data-colSpan={4} style={{fontSize:'16px'}}>
                                            Duration of the exam
                                        </th>
                                    </tr>
                                    <tr>
                                        <td><select id='exam'></select></td>
                                        <td><input type='number' defaultValue="60" placeholder='Enter Duration' id='dur' /><b> Mins.</b>
                                        </td>
                                    </tr>
                                </table>
                                <div className="table-responsive mob_overflow">
                                    <table id="category"></table>
                                </div>
                                <div className="table-responsive mob_overflow" style={{ paddingTop: "20px" }}></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;
