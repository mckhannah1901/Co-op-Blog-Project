import * as React from 'react';
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import Microposts from './Microposts';

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
    act( ()=>{render(<Microposts title='New Post'/>, container)} )
        expect(container.textContent).toBe("New Post")
});

it( "doesn't render without a title", ()=>{
    act( ()=>{render(<Microposts title=''/>, container)} )
    expect(container.textContent).toBe('')
});

it( 'renders with the micropost info type', ()=>{
    act( ()=>{render(<Microposts micropostInfoType='Created at:'/>, container)} )
        expect(container.textContent).toBe("Created at:")
});

it( "doesn't render without micropost info type", ()=>{
    act( ()=>{render(<Microposts micropostInfoType=''/>, container)} )
    expect(container.textContent).toBe('')
});
