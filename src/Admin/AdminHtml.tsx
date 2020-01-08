
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';
import { FaPlus } from 'react-icons/fa';
import { FiUpload } from 'react-icons/fi';



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
                                                    <button onClick={_this.add.bind(_this)} id="add" ><FaPlus /> Add</button>
                                                </div>
                                                <br />
                                                <textarea name="quetions" id="quetions" data-rows={4} className="Questions" required></textarea>
                                                <textarea name="formated_quetions" id="formated_quetions" data-rows={4} className="formated_quetions"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colSpan={4}>
                                                <div className="check">
                                                    <label className='container1'><input type="checkbox" id="para" name="para" /><span className='checkmark'></span></label>
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
                                    </tbody>
                                </table><br />
                                <br />
                                <div className='file_upload' style={{ display: "block" }}>
                                    <p className="heading">Bulk upload questions:</p>
                                    <p>Format:Questions,Program,Option1,Option2,Option3,Option4,Correct Answer</p>
                                    <button className="upload" onClick={_this.bulk_upload.bind(_this)}><FiUpload /> Upload</button>
                                    <input type="file" className="upload_file" />
                                    <br />
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
