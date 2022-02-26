
## openzeppelin@1.12.0源码阅读


- ERC20 ,ERC721 的介绍
- https://github.com/ethereum/EIPs
  - [ERC20](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md): 就是以太坊的标准接口
     - 作用：为了让各类token合约有一个特征与接口的共同标准
  - ERC721：以太坊token的标准接口（不可以分割的资产）
     - 与ERC20相比，ERC721 是用于处理不可以分割替换的资产的另外一种代币标准，不可以替换类似于房屋，家具等等
     - 又叫NFT

- 安装  openzeppelin-solidity@1.12.0
```
truffle init 

npm init 

npm install openzeppelin-solidity  

```

- 使用 import "openzeppelin-solidity/contract/access/rbac/Roles.sol"
- 模块综述：
    - access 地址白名单和基于签名的管理
    - crowdsale 众筹，管理token的众筹
    - Example: 一部分实例
    - introspection: 对ERC165的简单实现，ERC165主要用于创建标准方法，以发布和检测智能合约实现的接口
    - lifecycle 用于管理合约以及其资金的生命周期和行为的基础
    - math 数学数据库
    - mock 类似于单元测试的抽象
    - ownership  权限的管理，管理合约以及token所有权的集合
    - payment  管理托管，取款 支付相关的智能合约
    - proposales 对EIP-1046 所有的ERC都可以成为EIP 主要对EIP-20做了简单的拓展
    - token 一组ERC标准接口，主要是ERC20和ERC721


- Math库 
  - [SafeMath.sol](node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol) 安全运算
    - mul 判断  节约gas
    ```
     // gas优化
   
    //节约调用函数gas
    if (_a == 0) {
      return 0;
    }

    c = _a * _b;
    // 断言
    assert(c / _a == _b);
    return c;
    }
    ``` 
  - [Math.sol](node_modules/openzeppelin-solidity/contracts/math/Math.sol)  uint256与uint64的最值比较
- Ownership 详解
  - Rbac 
    - [Roles.sol](node_modules/openzeppelin-solidity/contracts/access/rbac/Roles.sol) 角色管理
    - [RBAC.sol ](node_modules/openzeppelin-solidity/contracts/access/rbac/RBAC.sol)角色拓展
  -  [Ownable.so](node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol) 合约所有权的管理
  - [CanReclaimToken.sol](node_modules/openzeppelin-solidity/contracts/ownership/CanReclaimToken.sol)  可回收的token
  - [Claimable.sol](node_modules/openzeppelin-solidity/contracts/ownership/Claimable.sol) 合约的拓展
-  Access详解
   - [SignatureBouncer.sol](node_modules/openzeppelin-solidity/contracts/access/SignatureBouncer.sol) 签名保护合约，只有指定的角色才能进行签名
   - [Whitelist.sol](node_modules/openzeppelin-solidity/contracts/access/Whitelist.sol) 白名单
- introspection:
   - [ERC165.sol](node_modules/openzeppelin-solidity/contracts/introspection/ERC165.sol)   创建和发布一个标准方法 **用于检查智能合约实现的接口
- [SupportsInterfaceWithLookup.sol](node_modules/openzeppelin-solidity/contracts/introspection/SupportsInterfaceWithLookup.sol) 支持查找的接口
- Proposals:
   - [TokenMetadata.sol](node_modules/openzeppelin-solidity/contracts/proposals/ERC1046/TokenMetadata.sol) 对ERC-URI的设置
- Token
   - ERC20
      - [ERC20.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol)   合约的拓展
      - [ERC20Basic.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Basic.sol) 基础的合约
      - [BasicToken.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/BasicToken.sol) 最简单的ERC20接口实现
      - [StandardToken.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol) 标准token实现
      ```
       balances[_from] = balances[_from].sub(_value);
       balances[_to] = balances[_to].add(_value);
      ``` 
      - [MintableToken.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol) 铸币合约
      - [CappedToken.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/CappedToken.sol) 铸币上限
      - [DetailedERC20.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol)   ERC20代币的名字符号
      - [Pausable.sol](node_modules/openzeppelin-solidity/contracts/lifecycle/Pausable.sol) 暂停合约
      - [RBACMintableToken.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/RBACMintableToken.sol) 对于铸币的权限
      - [StandardBurnableToken.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/StandardBurnableToken.sol) 标准token销毁
      - [TokenTimelock.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/TokenTimelock.sol) 锁定
      - [TokenVesting.sol](node_modules/openzeppelin-solidity/contracts/token/ERC20/TokenVesting.sol) 释放
  - ERC721
      - [AddressUtils.sol](node_modules/openzeppelin-solidity/contracts/AddressUtils.sol) 地址工具
      ```
       // 判断指定账户是否是合约账户
        function isContract(address _addr) internal view returns (bool) {
            uint256 size;
        
            // extcodesize 底层函数 确定是合约账户
            assembly { size := extcodesize(_addr) }
            return size > 0;
        }
      ``` 
      - [ERC721.sol](node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol) NFT元信息
      - [ERC721Basic.sol](node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Basic.sol) 接口原型
      - [ERC721BasicToken.sol](node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721BasicToken.sol) 基本实现
      - [ERC721Token.sol](node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol) 拓展实现,删除算法看一下
       ```
                function removeTokenFrom(address _from, uint256 _tokenId) internal {
            super.removeTokenFrom(_from, _tokenId);
            uint256 tokenIndex = ownedTokensIndex[_tokenId];
            uint256 lastTokenIndex = ownedTokens[_from].length.sub(1);
            //获取lasttoken
            uint256 lastToken = ownedTokens[_from][lastTokenIndex];

        //把lasttoken 置于删除的位置
            ownedTokens[_from][tokenIndex] = lastToken;
            // This also deletes the contents at the last position of the array
        // 总长度-1
            ownedTokens[_from].length--;
            ownedTokensIndex[_tokenId] = 0;
            ownedTokensIndex[lastToken] = tokenIndex;
        }
       ``` 

