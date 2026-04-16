# DesktopMind

> 漂浮在 Windows 桌面之上的透明思维工作台。把便利贴、文件引用、图片、书签、待办和连线直接放到桌面空间里，而不是塞进一个普通窗口。

DesktopMind 是一个基于 **Tauri 2 + React + TypeScript** 构建的桌面级可视化整理工具。它的目标不是替代传统笔记软件，而是把“临时思考、文件整理、关联关系、桌面工作流”放到同一个可视化平面中。

当前版本已经完成了从 **P1 可用 MVP** 到 **P2 体验增强** 的主要路线：支持桌面覆盖层、便利贴、文件卡片、图片节点、网页书签、待办、分组、搜索、标签、快捷键、最小地图、主题切换，以及“编辑 / 穿透”双模式交互。

---

## 这个项目适合做什么

- 在桌面上快速记录灵感，而不是切到另一个笔记窗口
- 把文件、图片、网页和文字片段组织成一个工作平面
- 用连线表达任务、资料、想法之间的关系
- 在桌面工作时保持上下文，不必频繁切换应用
- 用快捷键驱动的方式快速创建和整理节点

---

## 当前功能

### 画布与覆盖层
- 透明桌面覆盖层
- 编辑模式 / 穿透模式双模式交互
- 平移、缩放、重置视图
- 全局热键显示 / 隐藏覆盖层
- Minimap 最小地图导航
- 亮色 / 暗色 / 跟随系统主题

### 节点类型
- 便利贴节点
- 文本片段节点
- 待办清单节点
- 文件引用卡片
- 图片节点
- 网页书签节点
- 分组节点

### 组织与关联
- 节点拖拽、缩放、锁定
- 连线创建、标注、样式切换
- 多选、框选、批量移动 / 删除
- 标签系统与标签筛选
- 搜索面板（关键词 / 类型 / 标签）
- 分组创建、折叠、展开、解除分组

### 数据与工作流
- 本地自动保存与重载恢复
- 文件拖入生成卡片
- 剪贴板文本 / 图片 / URL 快速粘贴
- Markdown 预览与编辑
- 快捷操作面板
- 快捷键帮助面板

---

## 交互模型说明

DesktopMind 不是普通窗口应用，而是桌面覆盖层工具。为了减少与桌面、资源管理器和其他窗口的输入冲突，当前版本采用 **双模式交互**：

- **编辑模式**：用于创建、编辑、移动和整理节点
- **穿透模式**：将鼠标操作交还给桌面和其他窗口

推荐工作流：
1. 在编辑模式中整理节点
2. 想点击桌面或其他应用时切到穿透模式
3. 需要回来继续编辑时，用全局快捷键返回编辑模式

---

## 快速开始

### 运行环境
- Windows 10 / 11
- Node.js 18+
- Rust stable

### 一键启动
项目根目录提供了 Windows 启动脚本：

```bash
start-desktopmind.bat
```

它会尝试：
1. 检查 Node.js
2. 检查 pnpm / npm
3. 安装依赖
4. 检查 Cargo
5. 启动 `tauri dev`

### 手动启动

```bash
npm install
npm run dev:desktop
```

### 构建

```bash
npm run build
npm run tauri build
```

---

## 常用快捷键

### 快速新建
- `N`：新建便利贴
- `T`：新建文本片段
- `Shift+T`：新建待办清单
- `B`：新建网页书签

### 工作流
- `Enter`：编辑当前选中节点
- `F2`：重命名当前选中节点
- `Ctrl+K`：打开快捷操作面板
- `Ctrl+F`：打开搜索
- `Ctrl+Shift+L`：编辑选中节点标签

### 组织与画布
- `Ctrl+C / Ctrl+V`：复制 / 粘贴
- `Ctrl+D`：快速复制当前选中内容
- `Ctrl+G`：创建分组
- `Ctrl+Shift+G`：解除分组
- `Ctrl+Z / Ctrl+Y`：撤销 / 重做
- `Ctrl+A`：全选当前可见节点
- `Delete`：删除选中内容
- `Space + 拖拽`：平移画布
- `Ctrl+0`：重置视图

### 模式与系统
- `Ctrl+Shift+P`：切换编辑 / 穿透模式
- `Ctrl+Shift+E`：强制返回编辑模式
- `Ctrl+Shift+Space`：显示 / 隐藏覆盖层
- `?`：打开快捷键帮助
- `Esc`：关闭面板 / 取消当前操作

---

## 项目结构

```text
DesktopMind/
├─ package.json
├─ vite.config.ts
├─ tsconfig.json
├─ tsconfig.node.json
├─ index.html
├─ start-desktopmind.bat
├─ Rust.bat
├─ src/
│  ├─ App.tsx
│  ├─ main.tsx
│  ├─ components/
│  ├─ hooks/
│  ├─ stores/
│  ├─ utils/
│  ├─ styles/
│  └─ types/
└─ src-tauri/
   ├─ Cargo.toml
   ├─ tauri.conf.json
   ├─ build.rs
   ├─ capabilities/
   ├─ icons/
   └─ src/
```

---

## 根目录文件说明

### 前端与构建
- `package.json`：前端依赖、脚本入口与 Tauri 开发命令
- `vite.config.ts`：Vite 构建配置
- `tsconfig.json`：前端 TypeScript 配置
- `tsconfig.node.json`：Node / 构建脚本侧 TypeScript 配置
- `index.html`：Vite 前端入口 HTML

### 启动脚本
- `start-desktopmind.bat`：Windows 英文启动入口，推荐保留为主启动脚本
- `Rust.bat`：Rust 环境辅助安装脚本，偏本地开发辅助，不是应用本体的一部分
- `启动DesktopMind.bat`（如果保留）：中文别名启动脚本，和英文脚本功能重复，发布到 GitHub 时建议二选一，避免文件名编码带来跨平台压缩包兼容问题

### 源码目录
- `src/`：React 前端源码
- `src-tauri/`：Tauri / Rust 后端与桌面能力

---

## 主要源码目录说明

### `src/`
- `App.tsx`：应用总入口，负责把画布、工具栏、搜索、快捷操作、状态栏等拼起来
- `main.tsx`：React 挂载入口
- `components/Canvas/`：画布、网格背景、Minimap
- `components/Nodes/`：各类节点组件（便利贴、文件、图片、书签、分组、待办、文本）
- `components/Edges/`：连线渲染
- `components/Search/`：搜索面板
- `components/UI/`：工具栏、右键菜单、状态栏、快捷操作、快捷键帮助、标签显示
- `hooks/`：画布缩放、快捷键、拖拽、自动保存、文件拖入、主题、穿透模式等逻辑
- `stores/canvasStore.ts`：核心状态管理，基本相当于前端的“应用中枢”
- `utils/`：Markdown、标签、书签、剪贴板、通用辅助函数、工作流辅助函数
- `styles/global.css`：全局样式与主题样式
- `types/index.ts`：节点、边、画布等核心类型定义

### `src-tauri/`
- `Cargo.toml`：Rust 依赖声明
- `tauri.conf.json`：Tauri 应用配置、窗口配置、构建配置
- `build.rs`：Rust 构建脚本
- `capabilities/default.json`：Tauri 权限与能力声明
- `icons/`：应用图标资源
- `src/main.rs`：Rust 可执行入口
- `src/lib.rs`：桌面能力、文件元信息、全局快捷键、托盘、保存加载等核心逻辑

---

## 当前已知限制

- 当前主要面向 **Windows 10/11**
- 桌面覆盖层天然会比普通窗口应用更容易遇到输入边界问题，因此当前版本采用显式的编辑 / 穿透模式来保证可用性
- 网页书签元数据抓取受目标网站结构影响，部分页面只会退化为基础书签信息
- 当前版本更偏单机个人工具，还没有云同步和多画布协作

---

## 路线图

### 已完成
- P1：可用 MVP
- P2：搜索、标签、主题、Minimap、书签、分组、快捷操作、快捷键工作流增强

### 后续可继续推进
- 多画布管理
- 导入 / 导出 PNG、SVG、PDF
- 自动布局
- 更底层的 Windows 原生命中测试穿透
- 更完善的导出、发布与安装体验

---

## 项目定位

一句话定位：

> A transparent desktop overlay workspace for Windows, built with Tauri + React, designed for notes, files, bookmarks, grouping, and visual thinking on the desktop.

中文定位：

> 一个面向 Windows 的透明桌面思维工作台，用于在桌面空间中组织便利贴、文件、图片、网页书签和连线关系。

---

## 致谢

本项目基于以下技术栈构建：
- Tauri 2
- React 18
- TypeScript
- Zustand
- Vite

