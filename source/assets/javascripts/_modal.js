var Modal = (function() {

  var trigger = $qsa('.modal-trigger');
  var modals = $qsa('.modal');
  var modalsbg = $qsa('.modal-bg');
  var content = $qsa('.modal-content');
  var closers = $qsa('.modal-close');
  var w = window;
  var isOpen = false;
  var contentDelay = 0;
  var len = trigger.length;

  function $qsa(el) {
    return document.querySelectorAll(el);
  }

  var getId = function(event) {

    event.preventDefault();
    var self = this;
    var modalId = self.dataset.modal;
    var len = modalId.length;
    var modalIdTrimmed = modalId.substring(1, len);
    var modal = document.getElementById(modalIdTrimmed);
    makeDiv(self, modal);
  };

  var makeDiv = function(self, modal) {

    var fakediv = document.getElementById('modal-temp');

    if (fakediv === null) {
      var div = document.createElement('div');
      div.id = 'modal-temp';
      self.appendChild(div);
      moveTrig(self, modal, div);
    }
  };

  var moveTrig = function(trig, modal, div) {
    var trigProps = trig.getBoundingClientRect();
    var m = modal;
    var mProps = m.querySelector('.modal-content').getBoundingClientRect();
    var transX, transY, scaleX, scaleY;
    var xc = w.innerWidth / 2;
    var yc = w.innerHeight / 2;

    window.setTimeout(function() {
      window.requestAnimationFrame(function() {
        open(m, div);
      });
    }, contentDelay);

  };

  var open = function(m, div) {

    if (!isOpen) {
      var content = m.querySelector('.modal-content');
      m.classList.add('modal-active');
      content.classList.add('modal-content-active');

      content.addEventListener('transitionend', hideDiv, false);

      isOpen = true;
    }

    function hideDiv() {
      div.style.opacity = '0';
      content.removeEventListener('transitionend', hideDiv, false);
    }
  };

  var close = function(event) {

    event.preventDefault();
    event.stopImmediatePropagation();

    var target = event.target;
    var div = document.getElementById('modal-temp');

    if (isOpen && target.classList.contains('modal-bg') || target.classList.contains('modal-close')) {

      div.style.opacity = '1';
      div.removeAttribute('style');

      for (var i = 0; i < len; i++) {
        modals[i].classList.remove('modal-active');
        content[i].classList.remove('modal-content-active');
        trigger[i].classList.remove('modal-trigger-active');
      }

      div.addEventListener('transitionend', removeDiv, false);
      isOpen = false;
    }

    function removeDiv() {
      setTimeout(function() {
        window.requestAnimationFrame(function() {
          div.remove();
        });
      }, contentDelay);
    }

  };

  var bindActions = function() {
    for (var i = 0; i < len; i++) {
      trigger[i].addEventListener('click', getId, false);
      closers[i].addEventListener('click', close, false);
      modalsbg[i].addEventListener('click', close, false);
    }
  };

  var init = function() {
    bindActions();
  };

  return {
    init: init
  };

}());

Modal.init();
