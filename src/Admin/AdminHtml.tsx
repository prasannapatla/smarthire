
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { FaPlus } from 'react-icons/fa';
import { FiUpload, FiFile } from 'react-icons/fi';
//@ts-ignore
import sample from '../assets/Bulk_Question_Uploads.xlsx'

var page = function (_this: any) {

    return (
        <div className="Admin">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        {/* <Banner /> */}
                        <div className="data">
                            <div className="sect">
                                <table>
                                    <thead>
                                        <tr>
                                            <td colSpan={4}>
                                                <div className='heading'>
                                                    <br />Add Question</div>
                                                <div className="Add">
                                                    <button onClick={_this.add.bind(_this)} id="add" ><b><FaPlus /> Add</b></button>
                                                </div>
                                                <br />
                                                <textarea name="quetions" id="quetions" placeholder="Question" data-rows={4} className="Questions" required></textarea>
                                                <textarea name="formated_quetions" id="formated_quetions" placeholder="Code Snippet" data-rows={4} className="formated_quetions"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colSpan={4}>
                                                <div className="check">
                                                    <label className='container1'><input type="checkbox" className="full" id="para" name="para" /><span className='checkmark'></span></label>
                                                </div>
                                                <div className="pgm">Add Program code <b>*</b></div>
                                            </td>
                                        </tr>
                                        <br />
                                        <tr className="opt_hed">
                                            <th colSpan={3}>
                                                Options
                                        </th>
                                        </tr>
                                        <tr className="adm_btns">
                                            <td colSpan={4}>

                                                <select id="cat">

                                                </select>


                                            </td>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div className="check">
                                                    <label className='container1'><input type="radio" value="ans1" name="ans" required /><span className='checkmark'></span></label></div>
                                                <div className="checked"><input type="text" placeholder="Option1" id="ans1" name="opt1" required /></div>
                                            </td>
                                            <td>
                                                <div className="check">
                                                    <label className='container1'><input type="radio" value="ans3" name="ans" required /><span className='checkmark'></span></label>
                                                </div>
                                                <div className="checked">
                                                    <input type="text" placeholder="Option3" id="ans3" name="opt3" required />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div className="check">
                                                    <label className='container1'><input type="radio" value="ans2" name="ans" required /><span className='checkmark'></span></label>
                                                </div>
                                                <div className="checked">
                                                    <input type="text" placeholder="Option2" id="ans2" name="opt2" required />
                                                </div>
                                            </td>
                                            <td>
                                                <div className="check">
                                                    <label className='container1'><input type="radio" value="ans4" name="ans" required /><span className='checkmark'></span></label>
                                                </div>
                                                <div className="checked">

                                                    <input type="text" placeholder="Option4" id="ans4" name="opt4" required />
                                                </div>
                                            </td>
                                        </tr>
                                        <br />
                                    </tbody>
                                </table><br />

                                <div className='file_upload' style={{ display: "block" }}>
                                    <p className="heading" style={{ marginLeft: "3px" }}>Bulk upload questions:</p>
                                    <br />
                                    <br />
                                    <br />
                                    <div>Format: Questions, Program, Option1, Option2, Option3, Option4, Correct Answer&nbsp;&nbsp;&nbsp;<a className="linktodow" href={sample}>(Download Sample XLSX file)</a></div>
                                    <button className="upload" onClick={_this.bulk_upload.bind(_this)}><b><FiUpload /> Upload</b></button>
                                    {/* <input type="file" className="upload_file" />
                                    <br /> */}
                                    <input type="file" id="real-file" className="upload_file" style={{ visibility: 'hidden' }} />
                                    <button type="button" id="custom-button"><b><FiFile style={{ color: "#E5287C", marginLeft: "-4px" }} /> Choose a File</b></button>
                                    <span id="custom-text">No file chosen, yet.</span>
                                    <br />
                                    <br />
                                    <span className='que_progress'>-</span>
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
