
    import React from 'react';
    import { Link } from 'react-router-dom';

    var page = function (_this: any) {
        return (
            <div className="Routes">
                <h1 className="wel">Welcome</h1>
                <h2>Routes</h2><br />
                <Link to='/routes'>links</Link><br />
                
				<Link to='/'></Link><br />
				<Link to='/app'>app</Link><br />
				<Link to='/admin'>admin</Link><br />
				<Link to='/admin_menu'>admin_menu</Link><br />
				<Link to='/admin_add_cat'>admin_add_cat</Link><br />
				<Link to='/admin_list_que'>admin_list_que</Link><br />
				<Link to='/admin_view_result'>admin_view_result</Link><br />
				<Link to='/admin_que_set'>admin_que_set</Link><br />
				<Link to='/admin_register'>admin_register</Link><br />
				<Link to='/admin_detail_res'>admin_detail_res</Link><br />
				<Link to='/examstart'>examstart</Link><br />
				<Link to='/exampage'>exampage</Link><br />
				<Link to='/code_editor'>code_editor</Link><br />
				<Link to='/test'>test</Link><br />
				<Link to='/banner'>banner</Link><br />
				<Link to='/add_code'>add_code</Link><br />
				<Link to='/code_populate'>code_populate</Link><br />
				<Link to='/admin_list_code_que'>admin_list_code_que</Link><br />

            </div>
        )
    }
    export default page;
    