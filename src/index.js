import './main.css';
import { Elm } from './GearRatios.elm';
import registerServiceWorker from './registerServiceWorker';

Elm.GearRatios.init({
  node: document.getElementById('root')
});

registerServiceWorker();
