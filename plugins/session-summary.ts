/**
 * Session Summary Plugin - Work log on session.deleted
 * Hook: event (filters for session.deleted)
 */
import { getGitInfo, getProjectMemoryBinding, getTodoInfo } from "./lib/common";
import * as fs from "fs";
import * as path from "path";
import type { Plugin } from "@opencode-ai/plugin";

export const SessionSummaryPlugin: Plugin = async (ctx) => {
  return {
    async event({ event }) {
      if (event.type !== "session.deleted") return;
      const cwd = ctx.directory;
      const logDir = path.join(cwd, ".opencode", "logs");
      fs.mkdirSync(logDir, { recursive: true });

      const now = new Date();
      const ds = now.toISOString().split("T")[0].replace(/-/g, "");
      const logFile = path.join(logDir, `session-${ds}.md`);

      const git = getGitInfo(cwd);
      const todo = getTodoInfo(cwd);
      const binding = getProjectMemoryBinding(cwd);

      let log = `# Work Log - ${path.basename(cwd)}\n\n`;
      log += `**Time**: ${now.toISOString()}\n\n`;
      log += `## Changes\n`;
      if (git.is_repo && git.has_changes) {
        for (const c of git.changes) log += `- ${c}\n`;
      } else {
        log += "No changes\n";
      }

      if (binding.bound) {
        log += `\n## Obsidian Minimum Write-back\n`;
        log += `- Daily/YYYY-MM-DD.md\n`;
        log += `- ${binding.memoryPath || '.opencode/project-memory/<project_id>.md'}\n`;
        log += `- 00-Hub.md (only when top-level project status changes)\n`;
      }

      log += `\n## Next Steps\n`;
      if (git.has_changes) log += `- Uncommitted: ${git.changes_count} files\n`;
      if (todo.found && todo.pending > 0) log += `- Todos: ${todo.pending} pending\n`;
      if (binding.bound) log += `- Verify bound Obsidian updates before leaving this research turn\n`;

      fs.writeFileSync(logFile, log, "utf8");
      console.log(`📝 Session summary saved to ${logFile}`);
    },
  };
};
