import React from "react";
import Button from "./Button"

export default {
  title: "Button",
  component: Button,
}

const STORY_BUTTON_TEXT = "BUTTON";

export const Default = () => <Button>{STORY_BUTTON_TEXT}</Button>

export const Primary = () => <Button variant = "primary">{STORY_BUTTON_TEXT}</Button>