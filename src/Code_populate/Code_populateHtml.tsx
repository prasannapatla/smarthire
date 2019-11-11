
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';

var page = function (_this: any) {
    return (
        <div className="Code_populate">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        <Banner />
                        <div className="data">

                            <div className="sect">
                                <div className='heading'>Populate Coding Exam</div>
                                <div className="table-responsive mob_overflow">
                                    <table id="category"></table>
                                </div>
                                <div className="table-responsive mob_overflow" style={{ paddingTop: "20px" }}>
                                    <table className="table populate">
                                        <tr>
                                            <th>
                                                Select Exam
                                            </th>
                                            <th data-colSpan={4}>
                                                Number of questions
                                            </th>
                                            <th data-colSpan={4}>
                                                Duration of the exam
                                            </th>
                                        </tr>
                                        <tr>
                                            <td><select id='exam'></select></td>
                                            <td><input type='number' defaultValue="4" placeholder='Total questions' id='total' />
                                            </td>
                                            <td><input type='number' defaultValue="30" placeholder='Enter Duration' id='dur' />
                                            </td>
                                            <td style={{ paddingLeft: "5px", paddingRight: "10px" }}>Mins</td>
                                            <td>
                                                <input type='button' onClick={_this.create_que_set.bind(_this)} value='Populate Coding Exam' />
                                            </td>
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

