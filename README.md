
## openzeppelin源码阅读


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
  - node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol 安全运算
  - node_modules/openzeppelin-solidity/contracts/math/Math.sol  uint256与uint64的最值比较
- Ownership 详解
  - Rbac 
    - Roles.sol 角色管理
    - [RBAC.sol ](node_modules/openzeppelin-solidity/contracts/access/rbac/RBAC.sol)角色

  