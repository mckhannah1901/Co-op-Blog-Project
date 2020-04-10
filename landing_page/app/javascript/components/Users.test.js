import * as React from 'react';
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import Users from './Users';

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
    act( ()=>{render(<Users title='New User'/>, container)} )
        expect(container.textContent).toBe("New User")
});

it( "doesn't render without a title", ()=>{
    act( ()=>{render(<Users title=''/>, container)} )
    expect(container.textContent).toBe('')
});

it( 'renders with the user info type', ()=>{
    act( ()=>{render(<Users userInfoType='First Name'/>, container)} )
        expect(container.textContent).toBe("First Name")
});

it( "doesn't render without user info type", ()=>{
    act( ()=>{render(<Users userInfoType=''/>, container)} )
    expect(container.textContent).toBe('')
});

it( "renders with the user's detail", ()=>{
    act( ()=>{render(<Users userDetails="test@gmail.com"/>, container)} )
        expect(container.textContent).toBe("test@gmail.com")
});

it( "doesn't render without the user's details", ()=>{
    act( ()=>{render(<Users userDetails=''/>, container)} )
    expect(container.textContent).toBe('')
});
