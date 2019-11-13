
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';

var page = function (_this: any) {
    return (
        <div className="Add_code">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        <Banner />
                        <div className="data">
                            <div className="sect">
                                <table>

                                    <tr>
                                        <td colSpan={4}>
                                            <div className="prob">
                                                <div className='heading'>Coding Problem Statement</div>
                                                <textarea id="pblm_stmt" rows={5} required></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colSpan={4}>
                                            <div className="code">
                                                <div className='heading'>Code</div>
                                                <textarea id="code" rows={5} required></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colSpan={2}>
                                            <div className="sample_input">
                                                <div className='heading'>Sample Input</div>
                                                <textarea id="spl_inp" rows={5} required></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>

                                        <th>
                                            <div className='heading'>Coding Language</div>
                                        </th>

                                        <td colSpan={3}>
                                            <select id="lang">
                                                <option value="cpp">C/C++</option>
                                                <option value="java">Java</option>
                                                <option value="py3">Python</option>
                                                <option value="js">Javascript</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>

                                        <th>
                                            <div className='heading'>Test Input</div>
                                        </th>

                                        <th>
                                            <div className='heading'>Expected Output</div>
                                        </th>
                                    </tr>
                                    <tr>

                                        <td className="sample_input">
                                            <textarea id="t_inp_1" rows={5} required></textarea>
                                        </td>
                                        <td>
                                            <pre className='exp_op1'>Expected output</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td className="sample_input">
                                            <textarea id="t_inp_2" rows={5} required></textarea>
                                        </td>
                                        <td>
                                            <pre className='exp_op2'>Expected output</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td className="sample_input">
                                            <textarea id="t_inp_3" rows={5} required></textarea>
                                        </td>
                                        <td>
                                            <pre className='exp_op3'>Expected output</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td className="sample_input">
                                            <textarea id="t_inp_4" rows={5} required></textarea>
                                        </td>
                                        <td>
                                            <pre className='exp_op4'>Expected output</pre>
                                        </td>
                                    </tr>
                                </table><br />
                                <input type="button" value="Add" onClick={_this.add_code.bind(_this)} className="btn" /><br />
                                <div className='file_upload' style={{ display: "block" }}>
                                    <p className="heading">Bulk upload questions:</p>
                                    <select id="lang2">
                                        <option value="Select programming language">Select programming language</option>
                                        <option value="cpp">C/C++</option>
                                        <option value="java">Java</option>
                                        <option value="py3">Python</option>
                                        <option value="js">Javascript</option>
                                    </select>
                                    <input type="file" className="upload_file" />
                                    <button onClick={_this.bulk_upload.bind(_this)}>Upload file</button>
                                    <b>Format: </b>pblm_stmt,code,sample_input,t_inp_1,t_inp_2,t_inp_3,t_inp_4,lang(Optional)<br /><br />
                                    <span className='progress'>-</span>
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
