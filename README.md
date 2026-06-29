# 📦 电商产品开发 Skill 套装（三合一）

> **三大 Skill 联动覆盖电商新品开发全链路** — 从市场分析到执行落地，支持母婴/服饰/塑料/中大件四大品类

## ✨ 包含的 Skills

| # | Skill 名称 | 用途 | 核心亮点 |
|---|-----------|------|---------|
| 1 | **product-dev-workflow** | 通用6阶段产品开发框架 | 15个Excel公式倒推 + 四品类差异化矩阵 |
| 2 | **ouyun-sgrade-market-analysis** | 欧孕S级深度市场分析SOP | 18张分析表 / 43列字段拆解 / 四级定价公式 / 销售模型 |
| 3 | **category-prompts** | 四品类AI提示词模板库 | 每阶段可直接复制执行的提示词 + 品类专属增强指令 |

## 🔗 三Skill协作关系

```
product-dev-workflow        ← 方向盘：确定品类 + 阶段框架
         ↓
ouyun-sgrade-analysis       ← 引擎室：S级深度走完全流程（18表43列）
         ↓
category-prompts            ← 工具箱：复制提示词给AI直接执行
```

---

## 🚀 一键安装

### Windows（双击运行）
```bash
install.bat
```

### Mac / Linux
```bash
chmod +x install.sh && ./install.sh
```

### 手动安装
将对应文件夹复制到 `~/.workbuddy/skills/` 目录下：
```
~/.workbuddy/skills/
├── product-dev-workflow/SKILL.md           ← Skill #1
├── ouyun-sgrade-market-analysis/SKILL.md   ← Skill #2
└── category-prompts/SKILL.md               ← Skill #3
```

---

## 💬 使用方式

### 全流程开发（从0到1）
```
我要做 [品类] 的 [产品名] 开发，目标平台 [Amazon/淘系/抖音]。
请用 product-dev-workflow 走完全流程，重点参考 ouyun-sgrade-analysis 的定价模型。
```

### 快速市场分析
```
帮我做 [三级类目] 的市场分析，用 ouyun-sgrade-analysis SOP。
数据源：[淘系生参/卖家精灵/Helium10]
```

### 品类差异化分析
```
用 category-prompts 对 [母婴/服饰/塑料/中大件] 做Phase 1-4分析。
已知竞品数据：[粘贴]
```

### 触发关键词汇总
```
产品开发 | 选品 | 市场调研 | 竞品分析 | Amazon选品 | 跨境电商选品
BSR分析 | 市场容量 | 价格区间 | 品牌分析 | 上架时间 | 评论分析
S级品类 | 欧孕 | 定价定级 | 销售模型 | 品类提示词
```

---

## 📁 文件结构

```
public-Skill-PD/
├── README.md                                  # 本文件
├── install.bat                                # Windows 一键安装
├── install.sh                                 # Mac/Linux 一键安装
│
├── product-dev-workflow/                      # ★ Skill #1: 通用开发框架
│   ├── SKILL.md                               #    六阶段流程 + 四品类矩阵
│   └── references/
│       ├── market-capacity.md                 #    市场容量分析标准
│       ├── price-analysis.md                  #    价格区间分析方法
│       ├── brand-analysis.md                  #    品牌垄断系数计算
│       ├── shelf-time.md                      #    上架时间固化判断
│       └── formulas.md                        #    ⭐ 15个Excel公式还原
│
├── ouyun-sgrade-market-analysis/              # ★ Skill #2: S级深度SOP
│   └── SKILL.md                               #    18表43列 + 定价公式 + 销售模型
│
└── category-prompts/                          # ★ Skill #3: 提示词模板库
    └── SKILL.md                               #    六阶段提示词 + 四品类增强
```

---

## 🎯 覆盖的四大品类

| 品类 | 核心风险 | 利润空间 | SKU策略 | 特别关注 |
|------|---------|---------|---------|---------|
| 母婴用品 | 安全合规 | 高(30-50%) | 少而精 | 认证/材质/月龄分层 |
| 服装服饰 | 季节库存 | 中高(35-45%) | 控制变体 | 退货率/尺码矩阵/季节波动 |
| 塑料制品 | 同质化价格战 | 低(15-25%) | 主推1-2款 | 材质/开模成本/环保法规 |
| 中大件产品 | 物流成本 | 中(25-35%) | 1款打透 | 体积重/尾程/安装售后 |

---

## 🔧 技术依赖

- **WorkBuddy Desktop**（AI 助手平台）
- 数据采集建议配合 **卖家精灵 / 情报通BI / Helium10**
- 本套件为**纯方法论框架 + 提示词模板**，无需额外安装包

---

## 📝 版本历史

| 版本 | 日期 | 变更 |
|:----:|:----:|------|
| v2.0 | 2026-06-29 | 三合一套装：新增 ouyun-sgrade-analysis + category-prompts |
| v1.1 | 2026-06-29 | product-dev-workflow 新增四品类差异化章节 |
| v1.0 | 2026-06-05 | 初始版本，六阶段流程 + 15个公式 |

---

_Licensed for internal team use · Based on Dona's e-commerce product development methodology_

_GitHub: https://github.com/pineappletu-Dona/public-Skill-PD_
