import {Elm}from './app/Main.elm';
import './main.scss';
import './assets';

const app = Elm.Main.init({
    node: document.getElementById('app')


});

if (module.hot) {
    module.hot.accept();
}
