import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route, Switch, HashRouter } from 'react-router-dom';
import { createBrowserHistory } from 'history'
import * as serviceWorker from './serviceWorker';
import './index.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import App from './App/App';
import Not_found from './Not_found/Not_found';
import Myservice from './Myservice/Myservice';
import Login from './Login/Login';
import Admin from './Admin/Admin';
import Admin_menu from './Admin_menu/Admin_menu';
import Admim_add_cat from './Admim_add_cat/Admim_add_cat';
import Admin_list_que from './Admin_list_que/Admin_list_que';
import Admin_view_result from './Admin_view_result/Admin_view_result';
import Admin_que_set from './Admin_que_set/Admin_que_set';
import Admin_register from './Admin_register/Admin_register';
import Admin_detail_res from './Admin_detail_res/Admin_detail_res';
import Examstart from './Examstart/Examstart';
import Exampage from './Exampage/Exampage';
import Code_editor from './Code_editor/Code_editor';
import Test from './Test/Test';
import Banner from './Banner/Banner';
import Add_code from './Add_code/Add_code';
import Code_populate from './Code_populate/Code_populate';
import Admin_list_code_que from './Admin_list_code_que/Admin_list_code_que';
import Users from './Users/Users';
import Design1 from './Design1/Design1';
import Design2 from './Design2/Design2';
import Vishdesign from './Vishdesign/Vishdesign';
let route_link
try {
   let all_routes=require("./Routes/Routes").default
    route_link=<Route path="/routes" component={all_routes} />
} catch (error) {
    
}
    

// ReactDOM.render(<App />, document.getElementById('root'));

const history = createBrowserHistory()


ReactDOM.render((
    <Router history={history}>
        <HashRouter>
            <Switch>
				<Route exact path="/" component={Login} />
                <Route exact path="/app" component={App} />
				<Route path="/admin" component={Admin} />
				<Route path="/admin_menu" component={Admin_menu} />
				<Route path="/admin_add_cat" component={Admim_add_cat} />
				<Route path="/admin_list_que" component={Admin_list_que} />
				<Route path="/admin_view_result" component={Admin_view_result} />
				<Route path="/admin_que_set" component={Admin_que_set} />
				<Route path="/admin_register" component={Admin_register} />
				<Route path="/admin_detail_res" component={Admin_detail_res} />
				<Route path="/examstart" component={Examstart} />
				<Route path="/exampage" component={Exampage} />
				<Route path="/code_editor" component={Code_editor} />
				<Route path="/test" component={Test} />
				<Route path="/banner" component={Banner} />
				<Route path="/add_code" component={Add_code} />
				<Route path="/code_populate" component={Code_populate} />
				<Route path="/admin_list_code_que" component={Admin_list_code_que} />
				<Route path="/users" component={Users} />
				<Route path="/design1" component={Design1} />
				<Route path="/design2" component={Design2} />
				<Route path="/vishdesign" component={Vishdesign} />
                {route_link}
                <Route component={Not_found} />
            </Switch>
        </HashRouter>
    </Router>


), document.getElementById('root'))




// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
