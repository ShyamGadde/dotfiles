local text_generate_system_prompt = [[
Your task is to generate text based on the user's request. Follow these instructions precisely:

1. Return *ONLY* the generated text. Avoid including any additional explanations, comments, or metadata.

2. The text should be well-structured, coherent, and formatted appropriately for its intended purpose.

3. Ensure grammar, punctuation, and spelling are correct.

4. Adapt the tone and style to match the specified context or audience provided by the user.

5. If the task requires multiple paragraphs, maintain logical flow and organization throughout.

6. If the response does not fit in a single message, split the response into multiple messages, ensuring proper continuity.

7. Avoid including line numbers, source links, or unnecessary formatting unless explicitly requested by the user.

8. If specific constraints or guidelines are provided (e.g., word limit, specific vocabulary), adhere to them strictly.

9. When rephrasing or summarizing, preserve the original meaning and intent as closely as possible.

10. If generating structured content (e.g., tables, lists), ensure correct and consistent formatting.

Remember that your response SHOULD CONTAIN ONLY THE GENERATED TEXT to be used as-is for the intended purpose.
]]

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    optional = true,
    opts = {
      auto_insert_mode = false,
      auto_follow_cursor = false,
      insert_at_end = true,
      show_help = true,
      window = {
        width = 0.3,
      },
      prompts = {
        ImproveNaming = {
          prompt = "> /COPILOT_GENERATE\n\nImprove the names of the functions and variables in the selected code to more meaningful ones.",
        },
        COPILOT_TEXT_GENERATE = {
          system_prompt = text_generate_system_prompt,
        },
        TextSummarize = {
          prompt = "> /COPILOT_TEXT_GENERATE\n\nPlease summarize the following text.",
        },
        TextFix = {
          prompt = "> /COPILOT_TEXT_GENERATE\n\nPlease fix the grammar, punctuation, and spelling in the following text.",
        },
        TextConcise = {
          prompt = "> /COPILOT_TEXT_GENERATE\n\nPlease make the following text more concise without losing its original meaning.",
        },
        TextImprove = {
          prompt = "> /COPILOT_TEXT_GENERATE\n\nPlease improve the following text by rephrasing and enhancing its clarity and coherence.",
        },
      },
    },
  },
}
