import Typed from 'typed.js';




const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Find a purrfect match", "for your cat."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
