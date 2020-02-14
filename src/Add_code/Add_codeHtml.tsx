
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { FaPlus } from 'react-icons/fa';
import { FiUpload,FiFile } from 'react-icons/fi';



var page = function (_this: any) {
    return (
        <div className="Add_code">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        {/* <Banner /> */}
                        <div className="data">
                            <div className="sect">
                                <table className="Code_format">
                                    <tr>
                                        <td className="statement-heading">
                                            <b>Add coding problem statement</b>
                                    </td>
                                        <td className="Add">
                                            <button onClick={_this.add_code.bind(_this)} className="btn"><b><FaPlus/> Add
                                            </b></button>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colSpan={4}>
                                            <div className="prob">
                                                <textarea id="pblm_stmt" rows={5} placeholder="Coding Problem Statement" required></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colSpan={4}>
                                            <div className="code">
                                                <textarea id="code" rows={5} placeholder="Code" required></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colSpan={2}>
                                            <div className="sample_input">
                                                <textarea id="spl_inp" rows={5} placeholder="Sample Input" required></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>

                                        <th>
                                            <div className='heading'>Coding Language</div>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td className="language">
                                            <select id="lang">
                                                <option value="cpp">C/C++</option>
                                                <option value="java">Java</option>
                                                <option value="py3">Python</option>
                                                <option value="js">Javascript</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>

                                        <th>
                                            <div className='heading'>Test Input</div>
                                        </th>

                                        <th>
                                            <div className='output_heading'>Expected Output</div>
                                        </th>
                                    </tr>
                                    <tr>

                                        <td className="sample_input test_input">
                                            <textarea id="t_inp_1" rows={5} required></textarea>
                                        </td>
                                        <td>
                                            <pre className='output exp_op1'>Expected output</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td className="sample_input test_input">
                                            <textarea id="t_inp_2" rows={5} required></textarea>
                                        </td>
                                        <td>
                                            <pre className='output exp_op2'>Expected output</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td className="sample_input test_input">
                                            <textarea id="t_inp_3" rows={5} required></textarea>
                                        </td>
                                        <td>
                                            <pre className='output exp_op3'>Expected output</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td className="sample_input test_input">
                                            <textarea id="t_inp_4" rows={5} required></textarea>
                                        </td>
                                        <td>
                                            <pre className='output exp_op4'>Expected output</pre>
                                        </td>
                                    </tr>
                                    <br />
                                    <br />
                                </table><br />
                                </div>
                                <div className='file_upload' style={{ display: "block" }}>
                                    <p className="heading_upload">Bulk upload questions:</p>
                                    <select id="lang2">
                                        <option value="Select programming language">Select programming language</option>
                                        <option value="cpp">C/C++</option>
                                        <option value="java">Java</option>
                                        <option value="py3">Python</option>
                                        <option value="js">Javascript</option>
                                    </select><br/>
                                    <br/>
                                    <b>Format: </b>Problem statement,code,sample input,test input 1,test input 2,test input 3,test input4,Programming language(Optional)<br /><br />
                                    <button className="upload" onClick={_this.bulk_upload.bind(_this)}><FiUpload /> Upload</button>
                                    <input type="file" id="real-file" className="upload_file" style={{ visibility: 'hidden' }} />
                                    <button type="button" id="custom-button"><b><FiFile style={{ color: "#E5287C", marginLeft: "-4px" }} /> Choose a File</b></button>
                                    <span id="custom-text">No file chosen, yet.</span>
                                    <br />
                                    <br />
                                    <span className='code_que_progress'>-</span>
                                </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default page;
