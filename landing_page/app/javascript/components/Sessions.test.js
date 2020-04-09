import * as React from 'react';
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import Sessions from './Sessions';

let container = null;
beforeEach(() => {
  container = document.createElement("div");
  document.body.appendChild(container);
});

afterEach(() => {
  unmountComponentAtNode(container);
  container.remove();
  container = null;
});

it( 'renders with a title', ()=>{
    act( ()=>{render(<Sessions title='Log In'/>, container)} )
        expect(container.textContent).toBe("Log In")
});

it( "doesn't render without a title", ()=>{
    act( ()=>{render(<Sessions title=''/>, container)} )
    expect(container.textContent).toBe('')
});
