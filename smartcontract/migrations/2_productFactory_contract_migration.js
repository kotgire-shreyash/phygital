const ProductFactoryContract = artifacts.require("ProductFactory");

module.exports = function (deployer) {
  deployer.deploy(ProductFactoryContract);
};