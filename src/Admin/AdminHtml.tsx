
import React from 'react';
import { Link } from 'react-router-dom';
import Admin_menu from '../Admin_menu/Admin_menu';
import Banner from '../Banner/Banner';


var page = function (_this: any) {

    return (
        <div className="Admin">
            <div className="container">
                <div className="row">
                    <Admin_menu />
                    <div className="col-sm-9 content">
                        <Banner />
                        <div className="data">
                            <div className="sect">
                                <table>
                                <thead>
                                    <tr>
                                        <td colSpan={4}>
                                            <div className='heading'>Add Question</div><br />
                                            <textarea name="quetions" id="quetions" data-rows={4} className="Questions" required></textarea>
                                            <textarea name="formated_quetions" id="formated_quetions" data-rows={4} className="formated_quetions"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colSpan={4}>
                                            <br />
                                            <label style={{ float: "left" }}><input type="checkbox"  id="para" name="para" /> Add Program code <b>*</b></label>
                                        </td>
                                    </tr>
                                   
                                    <tr className="opt_hed">
                                        <th colSpan={3}>
                                            Options
                                        </th>
                                        <th>
                                            Select Correct<br />Option
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td colSpan={3}>
                                            <input type="text" placeholder="Option1" id="ans1" name="opt1" required />
                                        </td>
                                        <td>
                                            <label><input type="radio" value="ans1" name="ans" required /></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colSpan={3}>
                                            <input type="text"  placeholder="Option2" id="ans2" name="opt2" required />
                                        </td>
                                        <td>
                                            <label><input type="radio" value="ans2" name="ans" required /></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colSpan={3}>
                                            <input type="text"  placeholder="Option3" id="ans3" name="opt3" required />
                                        </td>
                                        <td>
                                            <label><input type="radio" value="ans3" name="ans" required /></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colSpan={3}>
                                            <input type="text"  placeholder="Option4" id="ans4" name="opt4" required />
                                        </td>
                                        <td>
                                            <label><input type="radio" value="ans4" name="ans" required /></label>
                                        </td>
                                    </tr>
                                    <tr className="adm_btns">
                                        <td colSpan={4}>

                                            <select id="cat">

                                            </select>
                                            <input type="button" onClick={_this.add.bind(_this)} value="add" id="add" />

                                        </td>

                                    </tr>
                                    </tbody>
                                </table><br />
                                <p> <b>*</b> Check this option for programming questions</p><br />
                                <div className='file_upload' style={{ display: "block" }}>
                                    <p className="heading">Bulk upload questions:</p>
                                 <input type="file" className="upload_file"  />File type:xls&nbsp;&nbsp;
                                    <button  onClick={_this.bulk_upload.bind(_this)}>Upload file</button>
                                    <b>Format: </b>Questions,Program,Option1,Option2,Option3,Option4,Correct Answer<br /><br />
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
