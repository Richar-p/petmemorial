// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require('webpack-jquery-ui');
require('webpack-jquery-ui/css');
require('select2')
require('select2/dist/css/select2.css')
require('material-icons');
require("chartkick/chart.js")

import { clearPetPopup } from '../src/pop_up';
import { deBouncer, checkDistance, linkPoints, loop, tooltipMargin } from '../src/canva';

export { clearPetPopup, deBouncer, checkDistance, linkPoints, loop, tooltipMargin }

export const getDeviceType = function () {
    const ua = navigator.userAgent;
    if (/(tablet|ipad|playbook|silk)|(android(?!.*mobi))/i.test(ua)) {
        return "tablet";
    }

    if (/Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Kindle|Silk-Accelerated|(hpw|web)OS|Opera M(obi|ini)/.test(ua)) {
        return "mobile";
    }

    return "desktop";
};