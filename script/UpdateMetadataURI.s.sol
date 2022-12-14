// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {Script} from "forge-std/Script.sol";
import {TestnetToken} from "bound-layerable/implementations/TestnetToken.sol";
import {SlimeShopImageLayerable} from "../src/SlimeShopImageLayerable.sol";
import {Attribute} from "bound-layerable/interface/Structs.sol";
import {DisplayType} from "bound-layerable/interface/Enums.sol";
import {TransparentUpgradeableProxy} from "openzeppelin-contracts/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import {Solenv} from "solenv/Solenv.sol";

contract UpdateMetadataBaseURI is Script {
    struct AttributeTuple {
        uint256 traitId;
        string name;
    }

    function setUp() public virtual {
        Solenv.config();
    }

    function getLayerTypeStr(uint256 layerId)
        public
        pure
        returns (string memory result)
    {
        uint256 layerType = (layerId - 1) / 32;
        if (layerType == 0) {
            result = "Portrait";
        } else if (layerType == 1) {
            result = "Background";
        } else if (layerType == 2) {
            result = "Texture";
        } else if (layerType == 5 || layerType == 6) {
            result = "Border";
        } else {
            result = "Object";
        }
    }

    function run() public {
        Solenv.config();

        address deployer = vm.envAddress("DEPLOYER");
        address metadataContract = vm.envAddress("METADATA_PROXY");
        string memory baseLayerURI = vm.envString("BASE_LAYER_URI");
        string memory defaultURI = vm.envString("DEFAULT_URI");
        string
            memory description = 'SLIMESHOP is a \\"create your own collage\\" project developed by Slimesunday and OpenSea that allows you to create your own Slimesunday inspired dream collage on the blockchain.';
        vm.startBroadcast(deployer);
        SlimeShopImageLayerable metadata = SlimeShopImageLayerable(
            metadataContract
        );

        // metadata.setBaseLayerURI(baseLayerURI);
        // metadata.setDefaultURI(defaultURI);
        // metadata.setDescription(description);
    }
}
