
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
                            <div className='heading'>Add Question</div><br />
                                <table>
                                    <thead>
                                        <tr>
                                            <td colSpan={4} style={{paddingTop:"15px"}}>
                                                <div className="Add">
                                                    <button onClick={_this.add.bind(_this)} id="add" ><b><FaPlus className="plus_icon"/> Add</b></button>
                                                </div>
                                                <br />
                                                <textarea name="quetions" style={{fontSize:'12px'}}id="quetions" placeholder="Question" data-rows={4} className="Questions" required></textarea>
                                                <textarea name="formated_quetions" id="formated_quetions" placeholder="Code Snippet" style={{fontSize:'12px'}} data-rows={4} className="formated_quetions"></textarea>
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
                                                <div className="checked"><input type="text" placeholder="Option 1" id="ans1" name="opt1" required style={{fontSize:"12px"}}/></div>
                                            </td>
                                            <td>
                                                <div className="check">
                                                    <label className='container1'><input type="radio" value="ans3" name="ans" required /><span className='checkmark'></span></label>
                                                </div>
                                                <div className="checked">
                                                    <input type="text" placeholder="Option 3" id="ans3" name="opt3" required style={{fontSize:"12px"}}/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div className="check">
                                                    <label className='container1'><input type="radio" value="ans2" name="ans" required /><span className='checkmark'></span></label>
                                                </div>
                                                <div className="checked">
                                                    <input type="text" placeholder="Option 2" id="ans2" name="opt2" required style={{fontSize:"12px"}}/>
                                                </div>
                                            </td>
                                            <td>
                                                <div className="check">
                                                    <label className='container1'><input type="radio" value="ans4" name="ans" required /><span className='checkmark'></span></label>
                                                </div>
                                                <div className="checked">

                                                    <input type="text" placeholder="Option 4" id="ans4" name="opt4" required style={{fontSize:"12px"}}/>
                                                </div>
                                            </td>
                                        </tr>
                                        <br />
                                    </tbody>
                                </table><br />

                                <div className='file_upload' style={{ display: "block" }}>
                                    <p className="heading" style={{fontSize:"15px", marginLeft: "3px" }}>Bulk Upload Questions:</p>
                                    <div style={{fontSize:"12px"}}><b>Format</b> : Questions, Program, Option 1, Option 2, Option 3, Option 4, Correct Answer&nbsp;&nbsp;&nbsp;<a className="linktodow" href={sample}>(Download Sample XLSX file)</a></div>
                                    <button className="upload" onClick={_this.bulk_upload.bind(_this)}><b><FiUpload /> Upload</b></button>
                                    {/* <input type="file" className="upload_file" />
                                    <br /> */}
                                    <input type="file" id="real-file" className="upload_file" style={{ visibility: 'hidden' }} />
                                    <button type="button" id="custom-button"><b><FiFile style={{ color: "#E5287C", marginLeft: "-4px",fontSize:"12px" }} /> Choose a File</b></button>
                                    <span id="custom-text" style={{fontSize:"12px"}}>No file chosen, yet.</span>
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
