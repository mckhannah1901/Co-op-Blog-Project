import * as React from 'react';
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import Home from './Home';

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
    act( ()=>{render(<Home title='Welcome to the Blogging Engine'/>, container)} )
        expect(container.textContent).toBe("Welcome to the Blogging Engine")
});

it( "doesn't render without a title", ()=>{
    act( ()=>{render(<Home title=''/>, container)} )
    expect(container.textContent).toBe('')
});

it( 'renders with content', ()=>{
    act( ()=>{render(<Home content='Login below!'/>, container)} )
        expect(container.textContent).toBe("Login below!")
});

it( "doesn't render without content", ()=>{
    act( ()=>{render(<Home content=''/>, container)} )
    expect(container.textContent).toBe('')
});
