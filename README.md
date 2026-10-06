# cj-skills

个人 Codex Skills 合集。仓库采用 monorepo 结构：每个 Skill 都位于 `skills/<skill-name>/`，并保持可独立复制、安装和维护。

## Skills

| Skill | 用途 | 状态 |
|---|---|---|
| [linux-source-learning](skills/linux-source-learning) | 系统化学习 Linux 内核源码、设计理由、历史和验证实验 | Experimental |

## 仓库结构

```text
cj-skills/
├── .github/workflows/
│   └── validate-skills.yml
├── scripts/
│   └── validate-skills.ps1
└── skills/
    └── linux-source-learning/
        ├── SKILL.md
        ├── README.md
        ├── agents/
        └── references/
```

每个 Skill 的顶层必须包含一个 `SKILL.md`。详细使用方式请阅读对应 Skill 目录中的 `README.md`。

## 安装

克隆仓库：

```bash
git clone https://github.com/CJ0510/cj-skills.git
cd cj-skills
```

### Windows PowerShell

```powershell
New-Item -ItemType Directory -Force "$HOME\.codex\skills" | Out-Null
Copy-Item -LiteralPath ".\skills\linux-source-learning" `
  -Destination "$HOME\.codex\skills" `
  -Recurse `
  -Force
```

### Linux、macOS 或 WSL

```bash
mkdir -p ~/.codex/skills
cp -R ./skills/linux-source-learning ~/.codex/skills/
```

安装后开启一个新对话，并显式调用 Skill 进行测试：

```text
使用 $linux-source-learning，帮我制定 Linux v6.1 VFS 子系统学习计划。
```

## 更新已安装 Skill

先更新仓库：

```bash
git pull --ff-only
```

然后重新复制需要的 Skill 目录。开发时以本仓库中的文件为唯一源码来源，避免仓库版本和 `~/.codex/skills/` 安装副本分别修改后产生偏差。

## 验证

在 Windows PowerShell 或 PowerShell 7 中运行：

```powershell
pwsh -File ./scripts/validate-skills.ps1
```

验证内容包括：

- 每个 Skill 是否存在 `SKILL.md`
- frontmatter 是否包含合法的 `name` 和 `description`
- Skill 目录名与 `name` 是否一致
- 是否遗留初始化 TODO
- `SKILL.md` 引用的本地 Markdown 文件是否存在
- `agents/openai.yaml` 是否包含必要的界面字段

推送和 Pull Request 也会通过 GitHub Actions 自动运行相同检查。

## 新增 Skill

1. 从 `main` 创建功能分支：

   ```bash
   git switch main
   git pull --ff-only
   git switch -c feat/add-<skill-name>
   ```

2. 在 `skills/<skill-name>/` 中创建完整、自包含的 Skill。
3. 在本 README 的 Skill 清单中登记。
4. 运行统一验证脚本。
5. 提交并通过 Pull Request 合并到 `main`。

建议提交类型：

```text
feat: add <skill-name> skill
fix: correct <skill-name> workflow
docs: update skill usage guide
chore: improve repository validation
```

## 分支策略

- `main`：始终保持可安装、可验证。
- `feat/*`：新增 Skill 或主要能力。
- `fix/*`：修复现有 Skill。
- `docs/*`：仅修改文档。
- 合并前必须通过本地校验和 GitHub Actions。
- 优先使用 Pull Request；保持线性历史时可以使用 fast-forward 或 squash merge。

## License

本仓库暂未附带开源许可证。在添加许可证前，默认版权仍由仓库所有者保留。
